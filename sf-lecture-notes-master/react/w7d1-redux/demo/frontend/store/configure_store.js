import { createStore } from 'redux'; // v1
import teamsReducer from '../reducers/teams_reducer';

const configureStore = () => (
  createStore(
    teamsReducer
  )
);

export default configureStore