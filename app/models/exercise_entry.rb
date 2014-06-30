class ExerciseEntry < ActiveRecord::Base
  validates :exercise_diary_page_id, null: false
  validates :cardio_exercise_id, null: false
  
  belongs_to :exercise_diary_page
  belongs_to :cardio_exercise
end
