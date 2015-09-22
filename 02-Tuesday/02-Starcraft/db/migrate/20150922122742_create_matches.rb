class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.text :winner_faction
      t.text :loser_faction
      t.integer :duration
      t.datetime :date
      t.integer :winner
      t.integer :loser

      t.timestamps null: false
    end
  end
end
