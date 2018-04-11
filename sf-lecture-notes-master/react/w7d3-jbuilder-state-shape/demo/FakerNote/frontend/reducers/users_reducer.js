import merge from 'lodash/merge';

const UsersReducer = (state = [], action) => {
	switch (action.type) {
		case 'RECEIVE_USERS':
			return action.users;
		default:
			return state;
	}
};
export default UsersReducer;


