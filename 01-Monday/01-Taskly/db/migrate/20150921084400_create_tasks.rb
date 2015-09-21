class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.string :user_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
