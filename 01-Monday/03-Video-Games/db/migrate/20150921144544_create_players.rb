class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
