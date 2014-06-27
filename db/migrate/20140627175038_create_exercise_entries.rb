class CreateExerciseEntries < ActiveRecord::Migration
  def change
    create_table :exercise_entries do |t|
      t.integer :exercise_diary_page_id
      t.integer :cardio_exercise_id 
      
      t.timestamps
    end
    add_index :exercise_entries, :exercise_diary_page_id
    add_index :exercise_entries, :cardio_exercise_id
  end
end
