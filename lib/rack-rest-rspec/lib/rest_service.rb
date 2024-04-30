require 'forwardable'


class RestService
  extend Forwardable
  
  
  attr_reader :path
  attr_reader :service
  attr_reader :browser

  def initialize(params = {})
    defaults = {
      :service => Sinatra::Base,
      :path => '/'
    }
    defaults.merge! params
    @service = defaults[:service]
    @path = defaults[:path]
    @browser = Rack::Test::Session.new(Rack::MockSession.new(@service))
  end
  
    def_delegators :@browser, :get, :post, :put, :delete

    def returned_data
      return JSON::parse(@browser.last_response.body, symbolize_names: true)
    end

end
