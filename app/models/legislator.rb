class Legislator < OpenStruct


  def self.collection
    collection = SunlightService.new.legislators.map {|raw_legislator|
      Legislator.new(raw_legislator)
    }
  end



end
