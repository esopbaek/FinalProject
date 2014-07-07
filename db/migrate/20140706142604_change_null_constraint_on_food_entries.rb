class ChangeNullConstraintOnFoodEntries < ActiveRecord::Migration
  def change
    change_column :food_entries, :meal, :string
  end
end
