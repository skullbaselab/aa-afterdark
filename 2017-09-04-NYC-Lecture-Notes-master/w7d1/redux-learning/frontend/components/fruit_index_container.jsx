import { connect } from 'react-redux';
import FruitIndex from './fruit_index';
import { addFruit } from '../actions/fruit_actions';

const mapStateToProps = (state) => {
  // debugger
  return ({
    fruits: state.fruits
  });
};

const mapDispatchToProps = (dispatch) => {
  debugger
  return ({
    addFruit: (fruit) => dispatch(addFruit(fruit))
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FruitIndex);
// connect takes two functions,
// 1 mapStateToProps
// 2 mapDispatchToProps

// final step, curry on React Component
