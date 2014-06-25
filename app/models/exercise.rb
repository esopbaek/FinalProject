class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates :minutes_spent, presence: true
  validates :cals_burned, presence: true
end
