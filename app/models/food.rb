class Food < ActiveRecord::Base
  validates :name, presence: true
  has_many :food_entries
  
  include PgSearch
  pg_search_scope :search_by_name, :against => :name
end
