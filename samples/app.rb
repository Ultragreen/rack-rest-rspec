# frozen_string_literal: true

require 'sinatra'

class Application < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get '/status' do
    status 208
    return { name: 'Sample App', version: '0.0.1', status: 'OK' }.to_json
  end

  get '/embeded_status' do
    status 208
    return { code: 208, data: { name: 'Sample App', version: '0.0.1', status: 'OK' } }.to_json
  end

  get '/collection' do
    return [{ one: 1 }, { two: 2 }, { three: 3 }].to_json
  end

  get '/embeded_collection' do
    return { code: 200, data: [{ one: 1 }, { two: 2 }, { three: 3 }] }.to_json
  end
end
