class FoodEntry < ActiveRecord::Base
  belongs_to :food
  belongs_to :diary_page
end
