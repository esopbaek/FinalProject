class AddMealAttributeToFoodEntries < ActiveRecord::Migration
  def change
    add_column :food_entries, :meal, :string, :null => false
  end
end
