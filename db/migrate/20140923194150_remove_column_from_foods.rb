class RemoveColumnFromFoods < ActiveRecord::Migration
  def change
    remove_column :foods, :potassium
    
  end
end
