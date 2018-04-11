import { connect } from 'react-redux';
import VeggieStand from './veggie_stand';
import { addVeggie } from '../actions';

const mapStateToProps = (state) => {
  // our veggieStand presentational component is expecting veggies to be an array
  // but our veggies are stored in an object in our redux state,
  // so make sure to format your props correctly
  return {
    veggies: Object.keys(state.veggie).map((veggieId) => state.veggie[veggieId]),
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    addVeggie: (veggie) => dispatch(addVeggie(veggie)),
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(VeggieStand);
