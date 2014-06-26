class CreateFoodEntries < ActiveRecord::Migration
  def change
    create_table :food_entries do |t|
      t.integer :diary_page_id
      t.integer :food_id
      
      t.timestamps
    end
    add_index :food_entries, :diary_page_id
    add_index :food_entries, :food_id
  end
end
