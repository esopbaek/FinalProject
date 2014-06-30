class ExerciseDiaryPage < ActiveRecord::Base
  belongs_to :user
  has_many :exercise_entries
  has_many :cardio_exercises, through: :exercise_entries, source: :cardio_exercise
end
