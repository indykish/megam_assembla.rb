module Megam
  class Assembla

    # GET /repos
    def get_spaces(access_token)
      @options = {:path => "/spaces?grant_type=access_token&access_token=#{access_token}",:body => ""}.merge(@options)
       puts "----------------------------------entry get repos"
       puts @options
      request(
        :expects  => 200,
        :method   => :get,
        :body     => @options[:body]
      )
    end   

  end
end
