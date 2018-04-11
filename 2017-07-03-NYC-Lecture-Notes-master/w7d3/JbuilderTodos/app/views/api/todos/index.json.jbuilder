
@todos.each do |todo|
  # usually in jbuilder, a block makes a new object
  # using set! makes a new object that will be nested under the key
  json.set!(todo.id) do
    # no body on the index view
    json.extract!(todo, :id, :title, :done)
  end
  # problem with this is that we are setting a key of id, title, and done
  # but on every iteration we are overwriting the old id, title, and done
  # this is ruby but jbuilder has given us this syntax through method missing
  # json.id todo.id
  # json.title todo.title
  # json.done todo.done
end
