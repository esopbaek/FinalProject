class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :measurement_id
      t.integer :amount

      t.timestamps
    end
    add_index :logs, :measurement_id
  end
end
