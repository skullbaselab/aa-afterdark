import { connect } from 'react-redux';
import TodoList from './todo_list';

// Actions
import { fetchTodos, createTodo, updateTodo, destroyTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = (state, ownProps) => ({
  todos: allTodos(state),
  errors: state.errors
});

// connect calls with 'dispatch' as argument
const mapDispatchToProps = dispatch => ({
  requestTodos: () => dispatch(fetchTodos()),
  createTodo: todo => dispatch(createTodo(todo)),
  updateTodo: todo => dispatch(updateTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
