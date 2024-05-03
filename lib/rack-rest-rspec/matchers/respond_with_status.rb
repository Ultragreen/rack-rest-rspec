# frozen_string_literal: true

RSpec::Matchers.define :respond_with_status do |options = {}|
  expected = options[:code]
  match do |actual|
    result = actual.browser.last_response
    result.status == expected
  end
  description do
    "respond with status code equal to #{expected}"
  end
  failure_message do |actual|
    result = actual.browser.last_response
    "expected #{actual} response would be equal \nto  : #{expected} \ngot : #{result.status}"
  end
  failure_message_when_negated do |actual|
    result = actual.browser.last_response
    "expected #{actual} response would not be equal \nto  : #{expected} \ngot : #{result.status}"
  end
end
