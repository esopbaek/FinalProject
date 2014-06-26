class AddTitletoSocialProfile < ActiveRecord::Migration
  def change
    add_column :social_profiles, :page_title, :string, default: ""
  end
end
