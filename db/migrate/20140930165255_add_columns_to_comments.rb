class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :commenter_id, :integer
    add_column :comments, :commenter_name, :string
  end
end
