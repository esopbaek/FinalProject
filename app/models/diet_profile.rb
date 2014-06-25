class DietProfile < ActiveRecord::Base
  belongs_to :user
  
  validates :current_weight, :presence => true 
  validates :goal_weight, :presence => true     
  validates :height_ft, :presence => true       
  validates :height_in, :presence => true       
  validates :gender, :presence => true          
  validates :activity_level, :presence => true  
  validates :user_id, :presence => true         
  validates :d_o_b, :presence => true           
  validates :goal_rate, :presence => true       
  validates :workouts_per_week, :presence => true
  validates :mins_per_workout, :presence => true
  
  def test
    return "testing baby"
  end
end
