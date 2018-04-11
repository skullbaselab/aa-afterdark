import React from 'react';

const HotDogs = (props) => {
  const allHotDogs = props.hotDogs.map( (hotDog, idx) => {
    return (
      <li key={idx}>
        {hotDog}
      </li>
    );
  });

  return (
    <div>
      <h3>
        Hello from the hawt dawg stand!
      </h3>

      <button onClick={props.addHotDog}>
        Add a hawt dawg!
      </button>

      <ul>
        {allHotDogs}
      </ul>
    </div>
  );
};

export default HotDogs;
