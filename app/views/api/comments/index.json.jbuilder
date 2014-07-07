json.array!(@comments) do |comment|
  json.partial!("comment", :comment => comment, :user => comment.user)
end