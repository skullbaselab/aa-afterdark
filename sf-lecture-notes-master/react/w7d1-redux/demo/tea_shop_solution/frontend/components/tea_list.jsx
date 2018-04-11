import React from 'react';
import Tea from './tea';

const TeaList = ({ teas, addBlackTea, addOolongTea, addGreenTea }) => {
  // debugger
  return (
    <div className="content">
      <h2>Teas</h2>
      <button onClick={addBlackTea}>Add Black Tea</button>
      <button onClick={addOolongTea}>Add Oolong Tea</button>
      <button onClick={addGreenTea}>Add Green Tea</button>

      <ul>
        {
          teas.map((tea, i) => (
            <Tea tea={tea} key={i} />
          ))
        }
      </ul>
    </div>
  );
};

export default TeaList;
