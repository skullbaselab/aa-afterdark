import React from 'react';

export default function Spinner({ errors }) {
  if (!errors) return null;
  const errorItems = errors.map(error =>
    <li key={ error }>{ error }</li>
  );

  return (
    <ul>
      { errorItems }
    </ul>
  );
}
