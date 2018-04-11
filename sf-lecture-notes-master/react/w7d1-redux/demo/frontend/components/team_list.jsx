import React from 'react';

const TeamList = ({ teams, addLeicester }) => { // v3
// const TeamList = ({ teams }) => { // v1
  return (
  <ul>
    {teams.map(team => (<li>{team}</li>))}
    <button onClick={addLeicester}>Add Leicester</button>
  </ul>
)};

   

export default TeamList;
