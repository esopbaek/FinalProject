class CreateExerciseDiaryPages < ActiveRecord::Migration
  def change
    create_table :exercise_diary_pages do |t|
      t.date :exercise_entry_date
      t.integer :user_id
      
      t.timestamps
    end
  end
end
