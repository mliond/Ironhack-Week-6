class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :name
      t.integer :minprice
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
