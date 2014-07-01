class ChangePostAndCommentTypes < ActiveRecord::Migration
  def change
    change_column :comments, :comment, :text
    change_column :posts, :content, :text
  end
end
