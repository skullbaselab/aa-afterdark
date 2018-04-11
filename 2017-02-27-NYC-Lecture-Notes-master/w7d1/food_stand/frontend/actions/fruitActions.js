export const ADD_FRUIT = "ADD_FRUIT";
export const CLEAR_FOOD = "CLEAR_FOOD";

// export const addApple = () => {
//
//   return {
//     type: ADD_FRUIT,
//     fruit: 'Apple'
//   };
// };
//
// export const addOrange = () => ({ // impicit return version, no debugging options
//   type: ADD_FRUIT,
//   fruit: 'Orange'
// });

export const clearFood = () => {
  return {
    type: CLEAR_FOOD
  };
};

export const addFruit = (fruit) => {
  return {
    type: ADD_FRUIT,
    fruit
  };
};

export const addApple = () => addFruit('Apple');
export const addOrange = () => addFruit('Orange');
