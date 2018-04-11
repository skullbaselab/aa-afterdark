const teamsReducer = (state = [], action) => { // v1
  switch(action.type) {
    case 'ADD_TEAM':
      return [...state, action.teamName];
    default:
      return state;
  }
};

export default teamsReducer;
window.teamsReducer = teamsReducer;


// state shape: // v0
// ["team1", "team2"]