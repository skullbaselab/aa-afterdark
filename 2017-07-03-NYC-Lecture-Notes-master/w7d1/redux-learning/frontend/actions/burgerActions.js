export const ADD_BURGER = "ADD_BURGER";

export const addBurger = (burger) => {
  return {
    type: ADD_BURGER,
    burger,
  };
};
