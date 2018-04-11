import React from 'react';
import Tea from './tea';

const TeaList = ({ teas, addOolongTea, addGreenTea, addBlackTea }) => (
  <div className="content">
    <h2>Teas</h2>

    <button onClick={addOolongTea}>Oolong</button>
    <button onClick={addBlackTea}>Black</button>
    <button onClick={addGreenTea}>Green</button>
    <ul>
      {
        teas.map((tea, i) => (
          <Tea key={i} tea={tea} />
        ))
      }
    </ul>
  </div>
);

export default TeaList;