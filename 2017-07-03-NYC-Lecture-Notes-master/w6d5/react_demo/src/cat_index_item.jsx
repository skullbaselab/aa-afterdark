import React from 'react';

                    // destructuring props
                    // props will be { gif: ..., selectedGifId: ..., handleClick: ...}
                    // we're just picking the keys we want
const CatIndexItem = ({ selectedGifId, gif, handleClick }) => {
  if (selectedGifId === gif.id) {
    return(
      <li onClick={() => handleClick(gif.id)}>
        {gif.id}
        <img src={gif.images.original.url} />
      </li>
    );
  }

  return(
    <li onClick={() => handleClick(gif.id)}>
      {gif.id}
    </li>
  );
};

export default CatIndexItem;
