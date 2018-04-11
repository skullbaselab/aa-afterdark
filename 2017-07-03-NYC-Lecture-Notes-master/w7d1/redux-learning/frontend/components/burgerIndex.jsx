import React from 'react';

const BurgerIndex = ({ burgers, clearOut }) => {
  const allBurgers = burgers.map((el, idx) => {
    return(
      <li key={idx}>{el}</li>
    );
  });
  // don't generally use idx for key. This should be a unique identifier

  return(
    <div>
      <h2>Burger Shack</h2>
      <ul>
        {allBurgers}
      </ul>
      <button onClick={clearOut}>Wipe out burgs and fruits</button>
    </div>
  );
};

export default BurgerIndex;
