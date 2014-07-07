class AddServingSizeQtyToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :serving_size_qty, :integer, :default => 0
  end
end
