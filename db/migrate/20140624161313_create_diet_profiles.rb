class CreateDietProfiles < ActiveRecord::Migration
  def change
    create_table :diet_profiles do |t|
      t.integer :current_weight, null: false
      t.integer :goal_weight, null: false
      t.integer :height_ft, null: false
      t.integer :height_in, null: false
      t.string :gender, null: false
      t.string :activity_level, null: false
      t.integer :workouts_per_week
      t.integer :mins_per_workout
      t.integer :user_id, null: false
      t.date :d_o_b, null: false
      t.string :goal_rate, null: false
      
      t.timestamps
    end
  end
end
