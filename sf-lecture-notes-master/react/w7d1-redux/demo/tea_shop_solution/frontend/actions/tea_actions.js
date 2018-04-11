export const ADD_TEA = 'ADD_TEA';

export const addBlackTea = () => ({
  type: ADD_TEA,
  tea: 'Black'
});

export const addOolongTea = () => ({
  type: ADD_TEA,
  tea: 'Oolong'
});

export const addGreenTea = () => ({
  type: ADD_TEA,
  tea: 'Green'
});

// *******************************************
// More programmatic way of handling the above
//
// export const addTea = (tea) => ({
//   type: ADD_TEA,
//   tea
// });
// *******************************************
