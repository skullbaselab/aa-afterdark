json.(todo, :id, :title, :created_at, :updated_at)

comments ||= nil
unless comments.nil?
  json.comments(comments) do |comment|
    json.partial!("api/comments/comment", :comment => comment)
  end
end
