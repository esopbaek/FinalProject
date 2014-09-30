class AddPosterIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :poster_id, :integer
    add_column :posts, :poster_name, :string
  end
end
