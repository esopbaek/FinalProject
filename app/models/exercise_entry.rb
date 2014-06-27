class ExerciseEntry < ActiveRecord::Base
  belongs_to :exercise_diary_page
  belongs_to :cardio_exercise
end
