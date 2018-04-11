import {fetchUsers, fetchNotebooks} from '../util/api_util';
import {receiveUsers, receiveNotebooks} from '../actions/actions';


export default ({dispatch}) => next => action => {
const usersSuccess = (users) => dispatch(receiveUsers(users));
const notebooksSuccess = (notebooks) => dispatch(receiveNotebooks(notebooks));

switch (action.type) {
	case 'REQUEST_USERS':
		fetchUsers(usersSuccess);
		next(action);
		break;
	case 'REQUEST_NOTEBOOKS':
		fetchNotebooks(action.userId, notebooksSuccess);
		next(action);
		break;
	default:
		next(action);
	}
};

