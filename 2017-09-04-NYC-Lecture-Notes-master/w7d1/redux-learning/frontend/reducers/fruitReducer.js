import { ADD_FRUIT, CLEAR_FRUIT } from '../actions/fruit_actions';

const fruitReducer = (state = [], action) => {
  switch (action.type) {
    case ADD_FRUIT: {
      // const fruits = state.fruits.concat(action.fruit);
      // const newState = Object.assign({}, state, { fruits });
      // return newState;
      return state.concat(action.fruit);
    }
    case CLEAR_FRUIT: {
      // const newState = Object.assign({}, state, { fruits: [] });
      // return newState;
      return [];
    }
    default:
    // debugger
      return state;
  }
};

export default fruitReducer;
