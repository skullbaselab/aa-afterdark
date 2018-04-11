json.array!(@todos) do |todo|
  json.partial!("todos/todo", :todo => todo)
end