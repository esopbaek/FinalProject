json.array!(@users) do |user|
	json.(user, :id, :username, :profile_photo)
end