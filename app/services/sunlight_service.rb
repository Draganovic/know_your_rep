class SunlightService

  def initialize
    @connection = Faraday.new(url:"https://congress.api.sunlightfoundation.com")
  end

end
