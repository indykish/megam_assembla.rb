require File.expand_path("#{File.dirname(__FILE__)}/../lib/megam/assembla")

require 'rubygems'
gem 'minitest' # ensure we are using the gem version
require 'minitest/autorun'
require 'time'

SANDBOX_HOST_OPTIONS = {
      :scheme => 'https',
  :host => 'api.assembla.com',
      :nonblock => false
 
}


def megam(options)  
  options = SANDBOX_HOST_OPTIONS.merge(options)
  mg=Megam::Assembla.new(options)  
end

def megams_new(options={})  
  mg=Megam::Assembla.new(options)  
end

def megams(options={}) 
  mg=Megam::Assembla.new(options)  
end

def random_domain
  "megam.co"
end

def random_id
  SecureRandom.random_number(1000)  
end

def random_name
  SecureRandom.hex(15)
end

def random_apikey
  SecureRandom.hex(10)
end

def random_email
  "email@#{random_apikey}.com"
end
 

def sandbox_apikey
   "IamAtlas{74}NobodyCanSeeME#07"
end

def sandbox_email
  "sandy@megamsandbox.com"
end
