json.array!(@todos) do |todo|
  json.partial!("todo", :todo => todo)
end