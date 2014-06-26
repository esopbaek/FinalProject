class CreateDiaryPages < ActiveRecord::Migration
  def change
    create_table :diary_pages do |t|
      t.date :entry_date, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :diary_pages, :user_id
  end
end
