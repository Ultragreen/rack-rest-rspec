class RestCRUDService

  attr_reader :path
  attr_reader :object 
  attr_reader :browser

  def initialize(params = {})
    defaults = {
      :path => '/api/', 
      :object => '', 
      :browser => Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))
    }
    defaults.merge! params
    @path = defaults[:path]
    @object = defaults[:object]
    @browser = defaults[:browser]
  end

  def url 
    return "#{@path}/#{@object}"
  end  

  def create_record _data
    return @browser.post self.url, _data
  end

  def retrieve_all_records
    return @browser.get self.url
  end  

  def retrieve_record _nb
    return @browser.get "#{self.url}/#{_nb}" 
  end


  def update_record _nb,_data
    return @browser.put "#{self.url}/#{_nb}", _data
  end


  def destroy_record _nb
    return @browser.delete "#{self.url}/#{_nb}"
  end

end
