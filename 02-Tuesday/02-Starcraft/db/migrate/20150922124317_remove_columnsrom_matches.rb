class RemoveColumnsromMatches < ActiveRecord::Migration
  def change
    remove_column :matches, :winner
    remove_column :matches, :loser
  end
end
