import { ADD_TEA } from '../actions/tea_actions';

const teasReducer = (state = [], action) => {
  Object.freeze(state);

  switch(action.type) {
    case ADD_TEA:
      const newState = [...state, action.tea];
      return newState;
    default:
      return state;
  }
};

export default teasReducer;