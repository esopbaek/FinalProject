class AddFoodAttributes < ActiveRecord::Migration
  def change
    add_column :foods, :serving_size, :string, :null => false
    add_column :foods, :servings_per_container, :integer, :default => 1
    add_column :foods, :brand, :string
  end
end
