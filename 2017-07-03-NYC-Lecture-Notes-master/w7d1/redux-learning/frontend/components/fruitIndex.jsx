import React from 'react';
import { connect } from 'react-redux';

const FruitIndex = ({ allFruit }) => {
  const fruits = allFruit.map((el, idx) => {
    return(
      <li key={idx}>{el}</li>
    );
  });
  // don't generally use idx for key, but this is all we have for now

  return(
    <div>
      <h2>Fruit Stand</h2>
      <ul>
        {fruits}
      </ul>
    </div>
  );
};

const mapStateToProps = (state) => {
  return {
    allFruit: state.fruits,
  };
};

export default connect(mapStateToProps, null)(FruitIndex);
// connect returns a function that we immediately invoke with FruitIndex as an argument
// check out the source code for connect :)
