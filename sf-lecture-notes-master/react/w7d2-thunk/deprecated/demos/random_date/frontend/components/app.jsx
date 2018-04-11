import React from 'react';

const App = ({loading, requestDate, dateFacts}) => {

  if (loading) {
    return (
      <div>Loading...</div>
    );
  } else {

    const lis = dateFacts.map( fact => (
      <li key={fact}>{fact}</li>
    ));

    return(
      <div>
        <button onClick={requestDate}>Fetch Date Fact!</button>
        <ul>
          {lis}
        </ul>
      </div>
    );
  }

};

export default App;
