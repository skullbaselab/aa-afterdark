import { RECEIVE_LISTS, RECEIVE_SINGLE_LIST } from '../actions/list_actions';
import { RECEIVE_SINGLE_USER } from '../actions/user_actions';

const listsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_LISTS:
      return Object.assign({}, state, action.lists);

    case RECEIVE_SINGLE_LIST:
      const list = action.payload.list;
      list.user_ids = action.payload.users.map(user => user.id);

      return Object.assign({}, state, {[list.id]: list});

    case RECEIVE_SINGLE_USER:
      const lists = action.payload.lists.reduce((acc, list) => {
        acc[list.id] = list;
        return acc;
      }, {});

      return Object.assign({}, state, lists);

    default:
      return state;
  }
};

export default listsReducer;
