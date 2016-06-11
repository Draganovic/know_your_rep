class SunlightService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url:"https://congress.api.sunlightfoundation.com")
  end

  # def senators
  # parse(get_senators).map { |raw_legislator|
  #   OpenStruct.new(raw_legislator)
  # }
  # end

  def senators_hash
    parse(get_senators)
  end

  def get_senators
    @connection.get "/legislators?chamber=senate&per_page=all&apikey=#{ENV["SUNLIGHT_KEY"]}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

end
