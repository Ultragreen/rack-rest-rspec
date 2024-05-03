describe 'Test REST API' do
  before :all do
    $service = RestService.new service: Application
    $data = { name: 'Sample App', version: '0.0.1', status: 'OK' }
    $collection = [{ one: 1 }, { two: 2 }, { three: 3 }]
  end

  subject { $service }
  context 'GET /status : test for status' do
    it { expect(subject.get('/status')).to be_correctly_sent }
    it { expect(subject).to respond_with_status code: 208 }
    it { expect(subject).to respond_a_record }
    it { expect(subject).to respond_with data: $data }
  end

  context 'GET /embeded_status : test for status' do
    it { expect(subject.get('/embeded_status')).to be_correctly_sent }
    it { expect(subject).to respond_with_status code: 208 }
    it { expect(subject).to respond_a_record root: :data }
    it { expect(subject).to respond_with data: $data, root: :data }
  end

  context 'GET /collection : test for Array' do
    it { expect(subject.get('/collection')).to be_correctly_sent }
    it { expect(subject).to respond_with_status code: 200 }
    it { expect(subject).to respond_a_collection_of_record }
    it { expect(subject).to respond_with_collection size: 3 }
    it { expect(subject).to respond_with data: $collection }
  end

  context 'GET /embeded_collection : test for Array' do
    it { expect(subject.get('/embeded_collection')).to be_correctly_sent }
    it { expect(subject).to respond_with_status code: 200 }
    it { expect(subject).to respond_a_collection_of_record root: :data }
    it { expect(subject).to respond_with_collection size: 3, root: :data }
    it { expect(subject).to respond_with data: $collection, root: :data }
  end
end
