def compare_array_of_hash expected, actual
  if expected.size == actual.size then
    res = true
    actual.each_with_index do |item,index|
      res = false unless item ==  expected[index]
    end
    return res
  else
    return false
  end
end

def prepare_array data
  data = (data.class == Hash)? [data] : data
  data.each do |ahash|
    ahash.symbolize!
  end
  return data
end


RSpec::Matchers.define :respond_with_data do |expected|
  result = ""
  match do |actual|
    result = actual.browser.last_response.body
    if result.empty? then
      false 
    else
      result = JSON::parse(result)
      result = prepare_array result
      expected = prepare_array expected
      compare_array_of_hash expected,result
    end
  end
  description do
    "respond with corresponding data"
  end
  failure_message_for_should do |actual|
    "expected #{actual} response body would be equal \nto  : #{expected}, \ngot : #{result}"
  end
  failure_message_for_should_not do |actual|
    "expected #{actual} response body would not be equal \nto  : #{expected}, \ngot : #{result}"
  end
end

