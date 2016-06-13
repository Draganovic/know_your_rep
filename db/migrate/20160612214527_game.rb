class Game < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score
      t.references :user
    end
  end
end
