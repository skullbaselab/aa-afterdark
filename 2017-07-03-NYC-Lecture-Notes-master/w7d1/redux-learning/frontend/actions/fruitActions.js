export const ADD_FRUIT = "ADD_FRUIT";
export const CLEAR_ALL = "CLEAR_ALL";

export const addFruit = (fruit) => {
  return {
    type: ADD_FRUIT,
    fruit,
  };
};

export const clearAll = () => {
  return {
    type: CLEAR_ALL,
  };
};
