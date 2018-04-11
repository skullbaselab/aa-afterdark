import teamsReducer from './teams_reducer';
import { combineReducers } from 'redux';

export default combineReducers({
  teams: teamsReducer
})