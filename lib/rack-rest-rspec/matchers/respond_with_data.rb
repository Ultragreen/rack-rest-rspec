# frozen_string_literal: true

def compare_array_of_hash(expected, actual)
  return false unless expected.size == actual.size

  res = true
  actual.each_with_index do |item, index|
    res = false unless item == expected[index]
  end
  res
end

def prepare_array(data)
  data.instance_of?(Hash) ? [data] : data
end

RSpec::Matchers.define :respond_with do |options = {}|
  expected = options[:data]
  match do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    if result.empty?
      false
    else
      result = prepare_array result
      expected = prepare_array expected
      compare_array_of_hash expected, result
    end
  end
  description do
    'respond with corresponding data'
  end
  failure_message do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    "expected #{actual} response body would be equal \nto  : #{expected}, \ngot : #{result}"
  end
  failure_message_when_negated do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    "expected #{actual} response body would not be equal \nto  : #{expected}, \ngot : #{result}"
  end
end
