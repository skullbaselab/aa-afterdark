import React from 'react';

const Hotdogs = ({ hotDogs }) => {
  const dawgs = hotDogs.map((dog) => {
    return <li>{dog}</li>
  });

  return(
    <ul>
      {dawgs}
    </ul>
  );
};

export default Hotdogs;
