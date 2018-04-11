json.(todo, :id, :title, :created_at, :updated_at)

comments ||= nil
unless comments.nil?
  json.comments(comments) do |comment|
    json.partial!("comments/comment", :comment => comment)
  end
end