class SunlightService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url:"https://congress.api.sunlightfoundation.com")
  end

  def senators
    parse(get_senators)
  end

  def get_senators
    @connection.get("/legislators?chamber=senate&per_page=all&apikey=#{ENV["SUNLIGHT_KEY"]}")
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def load_data
    senators.each do |record|
      name = record[:first_name] + " " + record[:last_name]
       Senator.where(name: name).first_or_create do |senator|
         senator.state_name = record[:state_name]
         senator.save!
      end
    end
  end

end
