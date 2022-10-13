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

    describe 'Posts REST API' do
      before :all do
        $service = RestService::new :service => MYRack::ModularApp
      end

      subject { $service }
      context "GET /api/v1/posts : test for a collections of Post (empty)" do
        it { expect(subject.get('/api/v1/posts')).to be_correctly_sent }
        it { expect(subject).to respond_with_status 200 }
        it { expect(subject).to respond_a_collection_of_record }
        it { expect(subject).to respond_with_collection_size 0 }
      end

      context "POST /api/v1/post : create a new record" do
        it { expect(subject.post('/api/v1/post',{id: 1, title: "test", body: "content"}.to_json)).to be_correctly_sent }
        it { expect(subject).to respond_with_status 201 }
      end

      context "GET /api/v1/posts : test for a collections of Post" do
        it { expect(subject.get('/api/v1/posts')).to be_correctly_sent }
   	it { expect(subject).to respond_with_status 200 }
        it { expect(subject).to respond_a_collection_of_record }
        it { expect(subject).to respond_with_collection_size 1 }
      end

      context "GET /api/v1/post/:id : get a record by code" do
        it { expect(subject.get("/api/v1/post/1")).to be_correctly_sent }
        it { expect(subject).to respond_with_status 200 }
        it { expect(subject).to respond_a_record }
        it { expect(subject).to respond_with_data({id: 1, title: "test", body: "content"}) }
      end

      context "DELETE /api/v1/post/:id : delete a pots by id" do
        it{ expect(subject.delete("/api/v1/post/1")).to be_correctly_sent }
        it { expect(subject).to respond_with_status 204 }
      end



    end


## Available matchers :

* be_correctly_send : check if return is HTTP valid
* respond_with_a_collection_of_record : check if the return is a JSON Array
* respond_a_record : check if the return is a JSON Hash
* respond_with_collection_size <Integer> : check if the collection have the good size
* respond_with_data <Object> : check if the return match the given object
* respond_with_status <Integer> : check if the HTTP response code is the good.





    

