import { connect } from 'react-redux';
import TodoDetailView from './todo_detail_view';
// Actions
import { deleteTodo, fetchTodo } from '../../actions/todo_actions';

const mapStateToProps = (state, ownProps) => {
  return {
    todo: state.todos[ownProps.todo.id]
  }
}

const mapDispatchToProps = (dispatch, { todo }) => ({
  fetchTodo: () => dispatch(fetchTodo(todo.id)),
  destroyTodo: () => dispatch(deleteTodo(todo))
});

export default connect(
  null, // todo props is already passed in
  mapDispatchToProps
)(TodoDetailView);
