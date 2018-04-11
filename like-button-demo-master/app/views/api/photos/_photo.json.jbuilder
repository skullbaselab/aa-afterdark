json.extract! photo, :id, :photo_url
json.num_likes photo.likes.size
json.like likes_hash[photo.id]
