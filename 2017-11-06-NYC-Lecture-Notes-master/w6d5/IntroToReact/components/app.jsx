import React from 'react';
import InfoIndex from './info_index';

const App = (props) => {
  // use className over class -- class is a JS keyword
  // 2 ways React components re-render is if props change

  return(
    <main id='whatevr' className='class'>
      <h1>React is AWESOME.</h1>
      <InfoIndex />
    </main>
  );
};

export default App;
