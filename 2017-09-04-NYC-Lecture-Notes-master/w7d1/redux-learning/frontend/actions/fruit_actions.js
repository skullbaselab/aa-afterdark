
export const ADD_FRUIT = "ADD_FRUIT";
export const CLEAR_FRUIT = "CLEAR_FRUIT";

export const addFruit = (fruit) => {
  return { type: ADD_FRUIT, fruit };
};

export const clearFruit = () => {
  return { type: CLEAR_FRUIT };
};
