import React from 'react';
import FruitInput from './fruit_input';

const FruitStand = (props) => {

  const allFruits = props.fruits.map( (fruit, idx) => {
    return (
      <li key={idx}>
        {fruit}
      </li>
    );
  });

  debugger;

  return (
    <div>
      <h3>
        Hello from the fruit stand!
      </h3>

      <button onClick={props.clearFood}>
        CLEAR FOOD
      </button>

      <button onClick={props.addApple}>
        Add an apple!
      </button>

      <button onClick={props.addOrange}>
        Add an orange!
      </button>

      <FruitInput />

      <ul>
        {allFruits}
      </ul>
    </div>
  );
};


export default FruitStand;
