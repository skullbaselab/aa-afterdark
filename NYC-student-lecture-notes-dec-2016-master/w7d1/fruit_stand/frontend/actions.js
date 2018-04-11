export const ADD_FRUIT = "ADD_FRUIT";
export const CLEAR = "CLEAR";
// use constants better debug/avoid typos that would otherwise silently fail

// action creators
export const addOrange = () => ({
  type: ADD_FRUIT,
  fruit: "Orange"
});

export const addApple = () => ({
  type: ADD_FRUIT,
  fruit: 'Apple'
});

export const addFruit = (fruit) => ({
  type: ADD_FRUIT,
  fruit
});

// TODO: add generic add fruit action

export const clearFruit = () => ({
  type: CLEAR
});

window.addOrange = addOrange;
window.addApple = addApple;
window.addFruit = addFruit;
