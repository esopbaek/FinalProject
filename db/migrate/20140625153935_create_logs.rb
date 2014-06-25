class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :measurement_id
      t.integer :unit
      t.integer :user_id

      t.timestamps
    end
  end
end
