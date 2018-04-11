Params: Rails 3 vs. Rails 4
===

One notable difference between Rails 3 and Rails 4 is how params are
handled. It's good to know the old way as well as the new, since you
might work with a Rails 3 app at your dev job some day.

The Rails 3 Way
---

The desired parameters are whitelisted in the model itself, using
`attr_accessible`.

```ruby
# app/models/todo.rb
class Todo < ActiveRecord::Base
  attr_accessible :title
end

# app/controllers/todos_controller.rb
class Api::TodosController < ApplicationController
  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      # ...
  end
end
```

The Rails 4 Way
---

The controller controls what params are allowed, using strong params.

```ruby
# app/controllers/todos_controller.rb
class Api::TodosController < ApplicationController
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      # ...
  end

  private
  def todo_params
     params.require(:todo).permit(:title)
  end
end
```
