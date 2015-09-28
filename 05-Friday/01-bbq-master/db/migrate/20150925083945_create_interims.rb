class CreateInterims < ActiveRecord::Migration
  def change
    create_table :interims do |t|
      t.belongs_to :barbecue, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
