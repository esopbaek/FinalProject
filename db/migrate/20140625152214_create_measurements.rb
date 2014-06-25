class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :measurements, :user_id
  end
end
