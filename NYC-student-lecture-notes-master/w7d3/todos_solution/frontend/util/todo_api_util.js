export const fetchTodos = success => {
  return $.ajax({
    method: 'GET',
    url: '/api/todos',
    success
  });
};

export const fetchTodo = (id, success) => {
  return $.ajax({
    method: 'GET',
    url: `/api/todos/${id}`,
    success
  });
};

export const createTodo = (todo) => {
  return $.ajax({
    method: 'POST',
    url: '/api/todos',
    data: todo,
  });
};

export const updateTodo = (todo) => {
  return $.ajax({
    method: 'PATCH',
    url: `/api/todos/${todo.id}`,
    data: { todo },
  });
};

export const destroyTodo = (todo, success) => {
  return $.ajax({
    method: 'DELETE',
    url: `api/todos/${todo.id}`,
    success
  });
};
