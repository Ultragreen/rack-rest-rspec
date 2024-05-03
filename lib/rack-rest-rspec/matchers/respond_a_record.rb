RSpec::Matchers.define :respond_a_record do |options={}|
  match do |actual|
    result = JSON::parse(actual.browser.last_response.body, symbolize_names: true)
    result  = result[options[:root]] unless options[:root].nil?
    result.class == Hash
  end
  description do
    "respond with a record (Hash)"
  end
  failure_message do |actual|
    result = JSON::parse(actual.browser.last_response.body, symbolize_names: true)
    result  = result[options[:root]] unless options[:root].nil?
    "expected #{actual} response body would be a record \nneed : Hash, \ngot  : #{result.class}"
  end
  failure_message_when_negated do |actual|
    result = JSON::parse(actual.browser.last_response.body, symbolize_names: true)
    result  = result[options[:root]] unless options[:root].nil?
    "expected #{actual} response body would not be a record \nneed : Hash, \ngot  : #{result.class}"
  end
end
