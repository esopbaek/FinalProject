class Measurement < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :logs
end
