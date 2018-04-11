import { DATE_CONSTANTS, receiveDateFact } from '../actions/date_actions';
import { FetchDateFact } from '../api_util/date_api_util';

const DateMiddleware = ({dispatch, getState}) => next => action => {
  // what the middleware does
  switch(action.type){
    case DATE_CONSTANTS.REQUEST_DATE_FACT:
      const success = data => { dispatch(receiveDateFact(data)); }
      FetchDateFact(success);
      return next(action);
    default:
      return next(action);
  }
};

export default DateMiddleware;
