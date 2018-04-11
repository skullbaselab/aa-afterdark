import {combineReducers} from 'redux';
import UsersReducer from './users_reducer';
import NotebooksReducer from './notebooks_reducer';

const rootReducer = combineReducers({
	users: UsersReducer,
	notebooks: NotebooksReducer
});

export default rootReducer;
