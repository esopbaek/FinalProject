class ExerciseDiaryPage < ActiveRecord::Base
  belongs_to :user
  has_many :exercise_entries
  has_many :cardio_exercises, through: :food_entries, source: :food
end
