RSpec::Matchers.define :respond_with_status do |expected|
  match do |actual|
    actual.browser.last_response.status == expected
  end
  description do
    "respond with status code equal to #{expected}"
  end
  failure_message do |actual|
    "expected #{actual} response would be equal \nto  : #{expected} \ngot : #{actual.browser.last_response.status}"
  end
  failure_message_when_negated do |actual|
    "expected #{actual} response would not be equal \nto  : #{expected} \ngot : #{actual.browser.last_response.status}"
  end
end
