import { connect } from 'react-redux';
import { addApple, addOrange, clearFruit } from '../actions';
import FruitStand from './fruit_stand';

// what in the redux state do I care about in this component?
// here we don't care about anything besides fruit, so we just pull out fruits
const mapStateToProps = state => {
  return {
  fruits: state.fruit
  };
};
// what do we want to change in our redux state?
const mapDispatchToProps = dispatch => {
  return {
  addApple: () => dispatch(addApple()),
  addOrange: () => dispatch(addOrange()),
  clearFruit: () => dispatch(clearFruit())
};};
// FruitStand component will now have props with above key value pairs
export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FruitStand);
