class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :amount
      t.references :user
      t.references :product
      t.timestamps null: false
    end
  end
end
