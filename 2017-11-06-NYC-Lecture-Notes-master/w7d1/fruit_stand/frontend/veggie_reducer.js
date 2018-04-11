import { ADD_VEGGIE } from './actions';

const defaultState = {2: {name: "cucumber"}};
const veggieReducer = (state = defaultState, action) => {
  let newState;
  switch (action.type) {
    case ADD_VEGGIE:
    // below produces brand new object, and adds state info to it, then overwrites
    newState = Object.assign({}, state, {[action.veggie.id]: action.veggie});
    return newState;
    default:
    return state;
  }
};

export default veggieReducer;
