class RemoveNullConstraintOnFoodEntries < ActiveRecord::Migration
  def change
    change_column :food_entries, :meal, :string, null: true
  end
end
