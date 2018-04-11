# json.partial!(partial: 'notebook', collection: @notebooks, as: :notebook)

# @notebooks.each do |notebook|
# 	json.set! notebook.id do
# 		json.partial! 'notebook', notebook: notebook
# 	end
# end

# json.array 'app-academy'

json.notebooks @notebooks do |notebook|
  json.title notebook.title
  json.description notebook.description
end