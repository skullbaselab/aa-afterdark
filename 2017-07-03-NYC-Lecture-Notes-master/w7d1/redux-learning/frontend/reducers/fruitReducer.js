import { ADD_FRUIT, CLEAR_ALL } from '../actions/fruitActions';

const fruitReducer = (state = [], action) => {

  switch (action.type) {
    case ADD_FRUIT:
      return state.concat(action.fruit);
    case CLEAR_ALL:
      return [];
    default:
      return state;
  }
};

export default fruitReducer;
