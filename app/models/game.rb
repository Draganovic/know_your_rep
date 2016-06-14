class Game <ActiveRecord::Base
  belongs_to :user

  def used_senators
    @used_senators ||= []
  end


end
