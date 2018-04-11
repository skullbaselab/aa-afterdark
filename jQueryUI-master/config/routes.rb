JQUIDemo::Application.routes.draw do
  root :to => "root#root"

  get "draggable" => "root#draggable"
  get "droppable" => "root#droppable"
  get "sortable" => "root#sortable"


end
