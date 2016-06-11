class Senator < ActiveRecord::Base

  def self.format_senators
    SunlightService.new.senators.map {|raw_senator|
      Senator.new(raw_senator)
    }
  end

end
