class Log < ActiveRecord::Base
  belongs_to :measurement
  
  validates :unit, presence: true
end
