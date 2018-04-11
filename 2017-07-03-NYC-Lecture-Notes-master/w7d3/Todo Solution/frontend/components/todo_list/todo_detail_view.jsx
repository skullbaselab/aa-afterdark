import React from 'react';

// Components
import StepListContainer from '../step_list/step_list_container';

class TodoDetailView extends React.Component {
  // I could leave off the constructor because this is what it does by default
  constructor(props) {
    super(props);
  }
  componentDidMount() {
    // this only fetches the steps for this todo. Because that's all we need for now
    this.props.requestSteps();
  }

  render() {
    const { todo, destroyTodo } = this.props;
    return(
      <div>
        <p className="todo-body">{todo.body}</p>
        <StepListContainer todo_id={todo.id} />
        <button className="delete-button" onClick={ destroyTodo }>
          Delete Todo
        </button>
        <ul className="tag-list">
          { todo.tags.map(tag => <li key={ tag.id }>{ tag.name }</li>)}
        </ul>
      </div>
    );
  }
}

export default TodoDetailView;
