class CreateSocialProfiles < ActiveRecord::Migration
  def change
    create_table :social_profiles do |t|
      t.integer :age, null: false
      t.string :gender, null: false
      t.text :about_me, default: ""
      t.text :why, default: ""
      t.text :inspir1, default: ""
      t.text :inspir2, default: ""
      t.text :inspir3, default: ""
      t.text :inspir4, default: ""
      t.integer :user_id

      t.timestamps
    end
    add_index :social_profiles, :user_id
  end
end
