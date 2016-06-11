class Senator < ActiveRecord::Base

  def self.all
    temp_senators_hash = SunlightService.new.senators_hash
    temp_senators_hash.map do |individual_hash|
      {
        name: individual_hash[:first_name] + " " + individual_hash[:last_name],
        state_name: individual_hash[:state_name]
      }
    end
  end
end
