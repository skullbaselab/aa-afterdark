import React from 'react';
import { connect } from 'react-redux';

function BurgerList({ burgers }) {
  debugger
  return (
  <ul>
    { burgers.map( (burger) => {
      return <li key={ burger.id }>{ burger.bunType }</li>;
    }) }
  </ul>
  );
}

// state comes from connect, which gets state from Provider
const mapStateToProps = function(state) {
  debugger
  // pass to BurgerList a prop called burgers, which comes from state
  return {
    burgers: Object.values(state.burgers)
  };
};

// exporting a connected version of BurgerList
export default connect(mapStateToProps, null)(BurgerList);
