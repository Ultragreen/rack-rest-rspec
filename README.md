# Rack REST RSpec 

RSpec Matchers for REST Rack webservice


Install it yourself as:

    $ gem install rack-rest-rspec

or

    $ bundle add 'rack-rest-rspec'

## Usage

### Basic usage : install in your spec/spec_helper.rb or spec/prepare.rb 

    require 'rack-rest-rspec/prepare'

### Basic usage : sample of spec matchers usage

Considering this API made with [Sinatra](https://sinatrarb.com/) :


```ruby
class Application < Sinatra::Base


    before do
        content_type 'application/json'
    end

    get '/status' do
        status 208
        return {name: "Sample App", version: "0.0.1", status: 'OK'}.to_json
    end

    get '/embeded_status' do
        status 208
        return {code: 208, data: {name: "Sample App", version: "0.0.1", status: 'OK'}}.to_json
    end

    get '/collection' do
        return [{one: 1}, {two: 2}, {three: 3}].to_json
    end

    get '/embeded_collection' do
        return {code: 200, data: [{one: 1}, {two: 2}, {three: 3}]}.to_json
    end

end
```

You could test this with rack-rest-rspec :

```ruby
describe 'Test REST API' do
    before :all do
      $service = RestService::new :service => Application
      $data = {name: "Sample App", version: "0.0.1", status: 'OK'}
      $collection = [{one: 1}, {two: 2}, {three: 3}]
    end
  
    subject { $service }
    context "GET /status : test for status" do
      it { expect(subject.get('/status')).to be_correctly_sent }
      it { expect(subject).to respond_with_status code: 208 }
      it { expect(subject).to respond_a_record }
      it { expect(subject).to respond_with data: $data }
    end

    context "GET /embeded_status : test for status" do
      it { expect(subject.get('/embeded_status')).to be_correctly_sent }
      it { expect(subject).to respond_with_status code: 208 }
      it { expect(subject).to respond_a_record root: :data }
      it { expect(subject).to respond_with data: $data, root: :data } 
    end
    

    context "GET /collection : test for Array" do
      it { expect(subject.get('/collection')).to be_correctly_sent }
      it { expect(subject).to respond_with_status code: 200 }
      it { expect(subject).to respond_a_collection_of_record }
      it { expect(subject).to respond_with_collection size: 3 }
      it { expect(subject).to respond_with data: $collection }
    end


    context "GET /embeded_collection : test for Array" do
      it { expect(subject.get('/embeded_collection')).to be_correctly_sent }
      it { expect(subject).to respond_with_status code: 200 }
      it { expect(subject).to respond_a_collection_of_record root: :data}
      it { expect(subject).to respond_with_collection size: 3,root: :data }
      it { expect(subject).to respond_with data: $collection, root: :data }
    end

  
  end
```
Output :

```
Test REST API
  GET /status : test for status
    is expected to be a valid HTTP verb request with a valid response return
    is expected to respond with status code equal to 208
    is expected to respond with a record (Hash)
    is expected to respond with corresponding data
  GET /embeded_status : test for status
    is expected to be a valid HTTP verb request with a valid response return
    is expected to respond with status code equal to 208
    is expected to respond with a record (Hash)
    is expected to respond with corresponding data
  GET /collection : test for Array
    is expected to be a valid HTTP verb request with a valid response return
    is expected to respond with status code equal to 200
    is expected to respond with a records collection (Array)
    is expected to respond with a collection of records size of 3
    is expected to respond with corresponding data
  GET /embeded_collection : test for Array
    is expected to be a valid HTTP verb request with a valid response return
    is expected to respond with status code equal to 200
    is expected to respond with a records collection (Array)
    is expected to respond with a collection of records size of 3
    is expected to respond with corresponding data

Finished in 0.01585 seconds (files took 0.25845 seconds to load)
18 examples, 0 failures
```

## Available matchers :

* be_correctly_send : check if return is HTTP valid
* respond_with_a_collection_of_record OPTIONAL[root: <:symbol>] : check if the return is a JSON Array, could be chroot with root:
* respond_a_record OPTIONAL[root: <:symbol>] : check if the return is a JSON Hash, could be chroot with root:
* respond_with_collection size: <Integer> OPTIONAL[root: <:symbol>] : check if the collection have the good size, could be chroot with root:
* respond_with  data: <Object> OPTIONAL[root: <:symbol>] : check if the return match the given object, could be chroot with root:
* respond_with_status <Integer> : check if the HTTP response code is the good.





    

