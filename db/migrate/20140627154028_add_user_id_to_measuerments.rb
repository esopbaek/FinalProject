class AddUserIdToMeasuerments < ActiveRecord::Migration
  def change
    add_column :measurements, :user_id, :integer
  end
end
