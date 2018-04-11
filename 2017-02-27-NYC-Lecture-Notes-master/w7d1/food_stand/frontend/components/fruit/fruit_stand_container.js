
import { connect } from 'react-redux'; // connect container component to store
import {
  addApple,
  addOrange,
  clearFood,
  addFruit
} from '../../actions/fruitActions';
import FruitStand from './fruit_stand';

// container connected to store, passes props to presentational component
// presentational component only renders props/state, knows nothing about Redux

// give pieces of Redux state to presentational component as props
const mapStateToProps = (state) => {
  return {
    fruit: state.fruit
  };
};

// allow presentational component to dispatch actions to change the store
const mapDispatchToProps = (dispatch) => {
  return {
    addApple: () => {
      return dispatch(addApple());
    },
    addOrange: () => dispatch(addOrange()),
    clearFood: () => dispatch(clearFood()),
    addFruit: (fruit) => dispatch(addFruit(fruit)),
  };
};

export default connect(
  mapStateToProps,   // connect will pass state in to this argument
  mapDispatchToProps // connect will pass dispatch in to this argument
)(FruitStand); // curry! - connect returns a function which we
// invoke with our presentational component - return value of this
// invocation is a component subscribed to the store with the props
// we give it in mapState... and mapDispatch...
// this subscription to the store will allow automatic re-rendering
// of the fruit stand component when slices of the Redux state
// that it cares about change (i.e. fruit)
