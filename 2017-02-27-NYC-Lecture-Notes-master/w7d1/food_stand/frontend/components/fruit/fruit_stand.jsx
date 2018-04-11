import React from 'react';

import FruitInput from './fruit_input';

// functional components don't need a
// render method -- they ARE a render method (essentially)
const FruitStand = (props) => {
  // construct array of <li>s
  // debugger
  const fruits = props.fruit.map((fruit) => {
    return (
      <li>
        {fruit}
      </li>
    );
  });

  return (
    <section>
      <ul>
        {fruits}
      </ul>
      <button onClick={props.addApple}>Add Apple</button>
      <button onClick={props.addOrange}>Add Orange</button>
      <button onClick={props.clearFood}>clear food</button>
      <FruitInput addFruit={props.addFruit} />
    </section>
  );
};


export default FruitStand;
