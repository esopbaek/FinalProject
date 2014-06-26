class AddLocationToSocialProfile < ActiveRecord::Migration
  def change
    add_column :social_profiles, :country, :string, default: ""
    add_column :social_profiles, :state, :string, default: ""
    add_column :social_profiles, :city, :string, default: ""
    add_column :social_profiles, :zip, :integer, default: ""
  end
end
