RSpec::Matchers.define :be_correctly_sent do
  match do |actual|
    actual.class == Rack::MockResponse
  end
  description do
    "be a valid HTTP verb request with a valid response return"
  end
  failure_message_for_should do |actual|
    "expected this HTTP verb request to return a valid response, \nneed : Rack::MockResponse \ngot  : #{actual.class}"
  end
  failure_message_for_should_not do |actual|
    "expected this HTTP verb request to not return a valid response, \nneed : Rack::MockResponse \ngot  : #{actual.class}"
  end
end
