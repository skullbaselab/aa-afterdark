# this means give me a key of todo that points to an object with whatever is in the block
json.todo do
  # this means render the todo partial and in that partial, the todo variable will equal @todo
  json.partial!('api/todos/todo', todo: @todo)
  # json.step_ids @todo.steps.pluck(:id)
end

json.steps do
  json.array!(@todo.steps)
end
