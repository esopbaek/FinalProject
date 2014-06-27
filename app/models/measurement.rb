class Measurement < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  has_many :logs, inverse_of: :measurement
end
