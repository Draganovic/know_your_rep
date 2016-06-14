class Senator < ActiveRecord::Base

  def self.not_used(used_senators)
    Senator.where.not(id: used_senators)
  end

end
