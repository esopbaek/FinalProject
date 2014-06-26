class DiaryPage < ActiveRecord::Base
  belongs_to :user
  has_many :food_entries
  has_many :foods, through: :food_entries, source: :food
end
