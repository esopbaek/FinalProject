class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :name, null: false
      t.string :unit
      t.integer :user_id

      t.timestamps
    end
  end
end
