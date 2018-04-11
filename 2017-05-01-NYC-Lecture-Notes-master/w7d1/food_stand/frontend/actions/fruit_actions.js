
export const ADD_FRUIT = 'ADD_FRUIT';
export const CLEAR_FOOD = 'CLEAR_FOOD';

export const addFruit = function (fruit) {
  return ({
    type: ADD_FRUIT,
    fruit: fruit
  });
};

export const clearFood = function () {
  return ({
    type: CLEAR_FOOD
  });
};

export const addApple = function () {
  return (addFruit('apple 🍎'));
};

export const addOrange = function () {
  return (addFruit('orange 🍊'));
};
