class CardioExercise < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :exercise_entries
end
