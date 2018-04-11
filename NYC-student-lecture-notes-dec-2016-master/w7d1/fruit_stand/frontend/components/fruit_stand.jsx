import React from 'react';
import FruitInput from './fruit_input';
// props is an object that has keys fruits, addApple, addOrange, clearFruit
// we use object destructuring to grab those keys
const FruitStand = ({fruits, addApple, addOrange, addFruit, clearFruit}) => {
  return (
    <div>
      <ul>
        {fruits.map((fruit, idx) => <li key={idx}>{fruit}</li>)}
      </ul>

      <button onClick={addApple}>Apple</button>
      <button onClick={addOrange}>Orange</button>
      <button onClick={clearFruit}>Clear</button>
      <FruitInput addFruit={addFruit}/>
    </div>
  );
};


export default FruitStand;
