json.array! @photos do |photo|
  json.partial! "api/photos/photo", photo: photo, likes_hash: @likes_hash
end
