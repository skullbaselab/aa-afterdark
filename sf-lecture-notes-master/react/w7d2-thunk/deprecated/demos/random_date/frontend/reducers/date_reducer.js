import { DATE_CONSTANTS } from '../actions/date_actions';
import { merge } from 'lodash';

const defaultState = {
  dateFacts: [],
  loading: false
};

const DateReducer = function(oldState = defaultState, action){
  switch(action.type){
    case DATE_CONSTANTS.REQUEST_DATE_FACT:
      return merge({}, oldState, {loading: true});
    case DATE_CONSTANTS.RECEIVE_DATE_FACT:
      const newList = [...oldState.dateFacts, action.fact];
      return {
        dateFacts: newList,
        loading: false
      }
    default:
      return oldState;
  }
};

export default DateReducer;
