RSpec::Matchers.define :respond_a_collection_of_record do
  match do |actual|
    JSON::parse(actual.browser.last_response.body).class == Array
  end
  description do
    "respond with a record collection (Array)"
  end
  failure_message do |actual|
    "expected #{actual} response body would be a collection \nneed : Array, \ngot  : #{JSON::parse(actual.browser.last_response.body).class}"
  end
  failure_message_when_negated do |actual|
    "expected #{actual} response body would not be a collection \nneed : Array, \ngot  : #{JSON::parse(actual.browser.last_response.body).class}"
  end
end
