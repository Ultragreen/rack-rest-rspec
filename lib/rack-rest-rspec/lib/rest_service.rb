# frozen_string_literal: true

require 'forwardable'

class RestService
  extend Forwardable

  attr_reader :path, :service, :browser

  def initialize(params = {})
    defaults = {
      service: Sinatra::Base,
      path: '/'
    }
    defaults.merge! params
    @service = defaults[:service]
    @path = defaults[:path]
    @browser = Rack::Test::Session.new(Rack::MockSession.new(@service))
  end

  def_delegators :@browser, :get, :post, :put, :delete

  def returned_data
    JSON.parse(@browser.last_response.body, symbolize_names: true)
  end
end
