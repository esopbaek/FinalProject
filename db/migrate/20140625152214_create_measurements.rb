class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :measurements, :user_id
  end
end
