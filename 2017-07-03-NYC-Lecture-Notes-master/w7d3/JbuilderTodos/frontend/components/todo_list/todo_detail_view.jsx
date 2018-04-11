import React from 'react';

// Components
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
  componentDidMount() {
    this.props.fetchTodo();
  }

  render() {
    const { todo, destroyTodo } = this.props;
    if (todo.step_ids) {
    return(
      <div>
        <p className="todo-body">{todo.body}</p>
        <StepListContainer stepIds={todo.step_ids} />
        <button className="delete-button" onClick={ destroyTodo }>
          Delete Todo
        </button>
      </div>
    );
  } else {
    return null;
  }
  }
}

export default TodoDetailView;
