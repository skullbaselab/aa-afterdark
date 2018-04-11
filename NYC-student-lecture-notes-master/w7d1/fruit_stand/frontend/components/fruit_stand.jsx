import React from 'react';
import FruitForm from './fruit_form';

// this is a functional component because it does not need internal state

const FruitStand = ({fruits, addApple, addOrange, clearFruit, addFruit}) => (
  <div>
    <button onClick={addApple}>Apple</button>
    <button onClick={addOrange}>Orange</button>
    <button onClick={clearFruit}>Clear</button>

    <FruitForm addFruit={addFruit} />

    <ul>
      {fruits.map((fruit, idx) => <li key={idx}>{fruit}</li>)}
    </ul>

  </div>
);

export default FruitStand;
