import React from 'react';

const CatIndexItem = ({cat, selectedCat, handleClick}) => {
  if (cat.id === selectedCat) {
    return (
      <li>
        <h2>{cat.name}</h2>
        <p>{cat.bio}</p>
      </li>
    );
  } else {
    return (
      <li onClick={() => handleClick(cat.id)}>{cat.name}</li>
    );
  }
}

export default CatIndexItem;
