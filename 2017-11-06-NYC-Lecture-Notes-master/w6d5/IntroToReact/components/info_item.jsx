import React from 'react';

const InfoItem = ({ character, id, selectedId, updateId }) => {
  // const { character } = props; <-- ES6 way
  // const character = props.character; <-- ES5 way
  if (id === selectedId) {
    return (
      <li>
        <p>{character.name}</p>
        <p>Height: {character.height}</p>
        <p>Birth Year: {character.birth_year}</p>
      </li>
    )
  } else {
    return(
      <li onClick={updateId(id)}>
        {character.name}
      </li>
    );
  }
};

export default InfoItem;
