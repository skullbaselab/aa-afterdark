import React from 'react';
import FruitStandContainer from './fruit/fruit_stand_container';
import HotDogStandContainer from './hot_dogs/hot_dogs_container';

const App = (props) => {
  return(
    <div>
      Fruit and Hotdogs for sale!
      <FruitStandContainer />
      <HotDogStandContainer />
    </div>
  );
};

export default App;
