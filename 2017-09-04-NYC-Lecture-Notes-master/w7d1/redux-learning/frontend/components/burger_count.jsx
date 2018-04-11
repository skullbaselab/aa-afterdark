import React from 'react';
import { connect } from 'react-redux';
import { addBurger } from '../actions/burger_actions';

const BurgerCount = (props) => {
  return (
    <div>
      <p>
        Num Burgers: {props.burgers}
      </p>
      <button onClick={props.addBurger}>Add Burger</button>
    </div>
  );
};

const mapStateToProps = (state) => {
  return ({
    burgers: state.burgers,
  });
};

const mapDispatchToProps = (dispatch) => {
  return ({
    addBurger: () => dispatch(addBurger()),
  });
};

export default connect(mapStateToProps, mapDispatchToProps)(BurgerCount);
