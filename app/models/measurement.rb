class Measurement < ActiveRecord::Base
  validates :name, presence: true
  has_many :logs
  belongs_to :user
end
