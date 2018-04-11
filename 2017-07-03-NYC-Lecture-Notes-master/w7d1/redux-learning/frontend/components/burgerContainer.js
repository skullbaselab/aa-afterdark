import { connect } from 'react-redux';
import BurgerIndex from './burgerIndex';
import { clearAll } from '../actions/fruitActions';

const mapStateToProps = ({ burgers }) => {
  debugger
  return {
    burgers: burgers
  };
};

const mapDispatchToProps = (dispatch) => {
  debugger
  return {
    clearOut: () => dispatch(clearAll())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(BurgerIndex);
// it doesn't matter what you name these functions, but the first argument to connect
// will be passed state, and the second will be passed dispatch
// it also doesn't matter in which order you define these functions
