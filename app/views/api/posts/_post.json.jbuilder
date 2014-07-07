json.(post, :id, :content, :user_id, :created_at, :updated_at)

comments ||= nil
unless comments.nil?
  json.comments(comments) do |comment|
    json.partial!("api/comments/comment", :comment => comment, :user => comment.user)
  end
end

json.user(user, :id, :username, :created_at, :updated_at)