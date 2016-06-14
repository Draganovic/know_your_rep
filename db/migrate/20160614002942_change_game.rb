class ChangeGame < ActiveRecord::Migration
  def change
    change_column_default :games, :score, 0
  end
end
