import { connect } from 'react-redux';
import { addApple, addOrange, addFruit, clearFruit } from '../actions';
import FruitStand from './fruit_stand';

const mapStateToProps = state => ({
  fruits: state.fruits
});

const mapDispatchToProps = dispatch => ({
  addApple: () => dispatch(addApple()),
  addOrange: () => dispatch(addOrange()),
  clearFruit: () => dispatch(clearFruit()),
  addFruit: (fruit) => dispatch(addFruit(fruit))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FruitStand);
