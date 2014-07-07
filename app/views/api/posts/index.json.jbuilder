json.array!(@posts) do |post|
  json.partial!("post", :post => post, :comments => post.comments, :user => post.user)
end