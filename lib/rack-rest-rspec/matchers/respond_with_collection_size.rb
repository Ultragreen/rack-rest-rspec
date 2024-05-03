RSpec::Matchers.define :respond_with_collection do |options = {}|
  expected = options[:size]
  match do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    result.size == expected
  end
  description do
    "respond with a collection of records size of #{expected}"
  end

  failure_message do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    "expected #{actual} response body collection would have a size of #{expected}, \ngot #{result.size}"
  end
  failure_message_when_negated do |actual|
    result = JSON.parse(actual.browser.last_response.body, symbolize_names: true)
    result = result[options[:root]] unless options[:root].nil?
    "expected #{actual} response body collection would not have a size of #{expected}, \ngot #{result.size}"
  end
end
