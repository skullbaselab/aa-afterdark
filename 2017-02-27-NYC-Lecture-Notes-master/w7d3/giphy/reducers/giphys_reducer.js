import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';

const GiphysReducer = (state = [], action) => {
  switch (action.type) {
    case RECEIVE_SEARCH_GIPHYS:
      return action.giphys; // replace oldstate with action payload
    default:
      return state;
  }
};

export default GiphysReducer;
