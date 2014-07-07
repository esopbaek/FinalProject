require 'addressable/uri'
require 'json'
require 'nokogiri'
require 'rest-client'

APPID = 'aef7b6ce'
APPKEY = '00e494cc1457fe526c7bcc8cb0910a32'

class Food < ActiveRecord::Base
  validates :name, presence: true
  has_many :food_entries
  
  include PgSearch
  pg_search_scope :search_by_name, :against => :name
  
  def self.search_results(foodname)
    Addressable::URI.new(
        :scheme => "https",
        :host => "api.nutritionix.com",
        :path => "v1_1/search/#{foodname}",
        :query_values => {
          :results => '0:50',
          :fields => "item_name,brand_name,nf_calories,nf_total_fat,nf_sodium,nf_total_carbohydrate,nf_sugars,nf_protein,nf_servings_per_container,nf_serving_size_qty,nf_serving_size_unit",
          :appId => APPID,
          :appKey => APPKEY
        }).to_s
  end
end

 # :fields => "item_id,item_name,brand_name,nf_calories,nf_calories_from_fat,nf_total_fat,nf_saturated_fat,nf_monounsaturated_fat,nf_polyunsaturated_fat,nf_trans_fatty_acid,nf_cholesterol,nf_sodium,nf_total_carbohydrate,nf_dietary_fiber,nf_sugars,nf_protein,nf_vitamin_a_dv,nf_vitamin_c_dv,nf_calcium_dv,nf_iron_dv,nf_servings_per_container,nf_serving_size_qty,nf_serving_size_unit",
