class Log < ActiveRecord::Base
  belongs_to :measurement
  validates :amount, presence: true
end
