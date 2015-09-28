class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.references :barbecue, index: true

      t.timestamps null: false
    end
  end
end
