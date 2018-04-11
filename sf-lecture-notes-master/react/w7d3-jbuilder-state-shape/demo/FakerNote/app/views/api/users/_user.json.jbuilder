json.extract!(
  user,
  :id, :username, :email, :image_url
)
json.notebookCount user.notebook_count