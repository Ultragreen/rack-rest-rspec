RSpec::Matchers.define :respond_with_collection_size do |expected|
  match do |actual|
    JSON::parse(actual.browser.last_response.body).size == expected
  end
  description do
    "respond with a collection of record size of #{expected}"
  end
  failure_message_for_should do |actual|
    "expected #{actual} response body collection would have a size of #{expected}, \ngot #{JSON::parse(actual.browser.last_response.body).size}"
  end
  failure_message_for_should_not do |actual|
    "expected #{actual} response body collection would not have a size of #{expected}, \ngot #{JSON::parse(actual.browser.last_response.body).size}"
  end
end
