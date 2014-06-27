class CreateCardioExercises < ActiveRecord::Migration
  def change
    create_table :cardio_exercises do |t|
      t.string :name, null: false
      t.integer :minutes
      t.integer :cals_burned
      
      t.timestamps
    end
  end
end
