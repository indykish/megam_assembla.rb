require "time"
require "excon"
require "uri"
require "zlib"
require 'openssl'

__LIB_DIR__ = File.expand_path(File.join(File.dirname(__FILE__), ".."))
unless $LOAD_PATH.include?(__LIB_DIR__)
$LOAD_PATH.unshift(__LIB_DIR__)
end

require "megam/api/errors"
require "megam/api/logs"
require "megam/core/stuff"
require "megam/core/text"
require "megam/core/log"
require "megam/core/json_compat"
require "megam/core/error"
require "megam/assembla/version"
require "megam/assembla/spaces"
require "megam/core/space"
require "megam/core/space_collection"


module Megam
  class Assembla

    #text is used to print stuff in the terminal (message, log, info, warn etc.)
    attr_accessor :text

    HEADERS = {
      'Accept' => 'application/json',
      'Accept-Encoding' => 'gzip',
      'User-Agent' => "megam-assembla/#{Megam::Assembla::VERSION}",
      'X-Ruby-Version' => RUBY_VERSION,
      'X-Ruby-Platform' => RUBY_PLATFORM
    }

    OPTIONS = {
      :headers => {},
      :host => 'api.assembla.com',
      :nonblock => false,
      :scheme => 'https'
    }

    API_VERSION1 = "/v1"

    def text
      @text ||= Megam::Text.new(STDOUT, STDERR, STDIN, {})
    end

    def last_response
      @last_response
    end

    # It is assumed that every API call will use an API_KEY/email. This ensures validity of the person
    # really the same guy on who he claims.
    # 3 levels of options exits
    # 1. The global OPTIONS as available inside the API (OPTIONS)
    # 2. The options as passed via the instantiation of API will override global options. The ones that are passed are :email and :api_key and will
    # be  merged into a class variable @options
    # 3. Upon merge of the options, the api_key, email as available in the @options is deleted.
    def initialize
      @options = OPTIONS
    end

    def request(params,&block)     
      just_color_debug("#{@options[:path]}")
      start = Time.now
      Megam::Log.debug("START")
      params.each do |pkey, pvalue|
        Megam::Log.debug("> #{pkey}: #{pvalue}")
      end

      begin
        response = connection.request(params, &block)        
      rescue Excon::Errors::HTTPStatusError => error
        klass = case error.response.status

        when 401 then Megam::API::Errors::Unauthorized
        when 403 then Megam::API::Errors::Forbidden
        when 404 then Megam::API::Errors::NotFound
        when 408 then Megam::API::Errors::Timeout
        when 422 then Megam::API::Errors::RequestFailed
        when 423 then Megam::API::Errors::Locked
        when /50./ then Megam::API::Errors::RequestFailed
        else Megam::API::Errors::ErrorWithResponse
        end
        reerror = klass.new(error.message, error.response)
        reerror.set_backtrace(error.backtrace)
        Megam::Log.debug("#{reerror.response.body}")
        reerror.response.body = Megam::JSONCompat.from_json(reerror.response.body.chomp)
        Megam::Log.debug("RESPONSE ERR: Ruby Object")
        Megam::Log.debug("#{reerror.response.body}")      
        raise(reerror)
      end

      @last_response = response
      Megam::Log.debug("RESPONSE: HTTP Status and Header Data")
      Megam::Log.debug("> HTTP #{response.remote_ip} #{response.status}")

      response.headers.each do |header, value|
        Megam::Log.debug("> #{header}: #{value}")
      end
      Megam::Log.debug("End HTTP Status/Header Data.")

      if response.body && !response.body.empty?
        if response.headers['Content-Encoding'] == 'gzip'
          response.body = Zlib::GzipReader.new(StringIO.new(response.body)).read
        end
        Megam::Log.debug("RESPONSE: HTTP Body(JSON)")
        Megam::Log.debug("#{response.body}")

        begin
          response.body = Megam::JSONCompat.from_json(response.body.chomp)
          Megam::Log.debug("RESPONSE: Ruby Object")
          Megam::Log.debug("#{response.body}")
        rescue Exception => jsonerr
          Megam::Log.error(jsonerr)
          raise(jsonerr)
        end
      end
      Megam::Log.debug("END(#{(Time.now - start).to_s}s)")
      # reset (non-persistent) connection
      @connection.reset
      response
    end

    private

    def just_color_debug(path)
      text.msg "--> #{text.color("(#{path})", :cyan,:bold)}"
    end

    #Make a lazy connection.
    def connection
      @options[:path] =API_VERSION1+ @options[:path]
      @options[:headers] = HEADERS.merge(@options[:headers])

      Megam::Log.debug("HTTP Request Data:")
      Megam::Log.debug("> HTTP #{@options[:scheme]}://#{@options[:host]}")
      @options.each do |key, value|
        Megam::Log.debug("> #{key}: #{value}")
      end
      Megam::Log.debug("End HTTP Request Data.")
      @connection = Excon.new("#{@options[:scheme]}://#{@options[:host]}",@options)
    end
  end
end
