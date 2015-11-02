RSpec::Matchers.define :respond_a_record do
  match do |actual|
    JSON::parse(actual.browser.last_response.body).class == Hash
  end
  description do
    "respond with a record (Hash)"
  end
  failure_message do |actual|
    "expected #{actual} response body would be a record \nneed : Hash, \ngot  : #{JSON::parse(actual.browser.last_response.body).class}"
  end
  failure_message_when_negated do |actual|
    "expected #{actual} response body would not be a record \nneed : Hash, \ngot  : #{JSON::parse(actual.browser.last_response.body).class}"
  end
end
