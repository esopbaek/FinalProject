class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.integer :calories, default: 0
      t.integer :total_fat, default: 0
      t.integer :saturated, default: 0
      t.integer :polyunsaturated, default: 0
      t.integer :monounsaturated, default: 0
      t.integer :trans, default: 0
      t.integer :cholesterol, default: 0
      t.integer :sodium, default: 0
      t.integer :potassium, default: 0
      t.integer :carbs, default: 0
      t.integer :fiber, default: 0
      t.integer :vitamin_a, default: 0
      t.integer :vitamin_c, default: 0
      t.integer :calcium, default: 0
      t.integer :iron, default: 0
      t.timestamps
    end
  end
end
