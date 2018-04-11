import { connect } from 'react-redux';
import FruitStand from './fruit_stand';
import {
  addApple,
  addOrange,
  clearFood
} from '../../actions/fruit_actions';

const mapStateToProps = (state) => {
  return ({
    // Lets us access fruits in state. Gives fruits as props to FruitStand
    fruits: state.fruits
  });
};

const mapDispatchToProps = (dispatch) => {
  return ({
    // VALUES MUST BE FUNCTIONS
    addApple: () => { dispatch(addApple()); },
    addOrange: () => { dispatch(addOrange()); },
    clearFood: () => { dispatch(clearFood()); }
  });
};

// Lets FruitStand access state
// Connect returns a function
export default connect(
  mapStateToProps,
  mapDispatchToProps
)(FruitStand);
