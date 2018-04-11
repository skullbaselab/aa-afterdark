import { connect } from 'react-redux';
import { addApple, addOrange, clearFruit, addFruit } from '../actions';
import FruitStand from './fruit_stand';

const mapStateToProps = state => ({
  fruits: state.fruits
});

// const mapStateToProps = ({ fruits }) => ({ fruits });

const mapDispatchToProps = dispatch => ({
  addApple: () => dispatch(addApple()),
  addOrange: () => dispatch(addOrange()),
  clearFruit: () => dispatch(clearFruit()),
  addFruit: (fruit) => dispatch(addFruit(fruit)),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FruitStand);
