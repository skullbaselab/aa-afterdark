import React from 'react';
import FruitIndex from './fruitIndex';
import BurgerIndex from './burgerContainer';
import BurgerForm from './burgerForm';

const App = () => {
  return(
    <div>
      <h1>
          My Fruit stand brings all the programmers to the yard
      </h1>
      <FruitIndex />
      <BurgerForm />
      <BurgerIndex />
    </div>
  );
};

export default App;
