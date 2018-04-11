import { ADD_HOT_DOG } from '../actions/hot_dog_actions';
import { CLEAR_FOOD } from '../actions/fruit_actions';

const defaultState = [];

const hotDogReducer = (state = defaultState, action) => {
  switch (action.type) {
    case ADD_HOT_DOG:
      return [
        ...state,
        "hawt dawg 🌭"
      ]
    case CLEAR_FOOD:
      return defaultState;
    default:
      return state
  }
};

export default hotDogReducer;
