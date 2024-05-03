# frozen_string_literal: true

RSpec::Matchers.define :respond_a_collection_of_record do |options = {}|
  match do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    result.instance_of?(Array)
  end
  description do
    'respond with a records collection (Array)'
  end
  failure_message do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:oot].nil?
    "expected #{actual} response body would be a collection \nneed : Array, \ngot  : #{result.class}"
  end
  failure_message_when_negated do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    "expected #{actual} response body would not be a collection \nneed : Array, \ngot  : #{result.class}"
  end
end
