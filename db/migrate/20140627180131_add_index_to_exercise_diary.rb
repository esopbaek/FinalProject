class AddIndexToExerciseDiary < ActiveRecord::Migration
  def change
    add_index :exercise_diary_pages, :user_id
  end
end
