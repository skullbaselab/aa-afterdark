// this prevents typos
export const ADD_FRUIT = "ADD_FRUIT";
export const CLEAR = "CLEAR";
export const ADD_VEGGIE = "ADD_VEGGIE";

export const addOrange = () => ({
  type: ADD_FRUIT,
  fruit: "Orange"
});

export const addApple = () => {
  return {
  type: ADD_FRUIT,
  fruit: 'Apple'
};};

export const clearFruit = () => ({
  type: CLEAR
});

export const addVeggie = (veggie) => {
  return {
    type: ADD_VEGGIE,
    veggie,
  };
};
