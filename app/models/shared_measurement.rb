class SharedMeasurement < ActiveRecord::Base
  belongs_to :measurement
  belongs_to :user
end
