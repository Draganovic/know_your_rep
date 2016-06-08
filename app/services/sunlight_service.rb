class SunlightService

  def initialize
    @connection = Faraday.new(url:"https://congress.api.sunlightfoundation.com")
  end

  def legislators
  parse(get_legislators).map { |raw_legislator|
    OpenStruct.new(raw_legislator)
  }
end

private

  def get_legislators
    @connection.get "/legislators?apikey=#{ENV["SUNLIGHT_KEY"]}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

end
