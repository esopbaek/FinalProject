class AddMealColumnToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :meal, :string, :default => ""
  end
end
