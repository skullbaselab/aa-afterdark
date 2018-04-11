import { ADD_FRUIT, CLEAR_FOOD } from '../actions/fruit_actions';

const defaultState = [];

// Reducers are PURE FUNCTIONS
// -> Take an input, spit out an output
// -> DO NOT MUTATE OLD STATE. RETURN NEW STATE.

const fruitReducer = (fruitState = defaultState, action) => {
  Object.freeze(fruitState);
  switch (action.type) {
    case ADD_FRUIT:
      return [
        ...fruitState,
        action.fruit
      ];
    case CLEAR_FOOD:
      return defaultState;
    default:
    // YOU 👏 MUST 👏 RETURN 👏 STATE 👏
      return fruitState;
  }
};

// export DEFAULT
// -> Can call whatever we want in import
export default fruitReducer;
