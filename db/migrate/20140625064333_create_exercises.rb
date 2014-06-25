class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name, null: false
      t.integer :minutes_spent, null: false
      t.integer :cals_burned, null: false
      
      t.timestamps
    end
  end
end
