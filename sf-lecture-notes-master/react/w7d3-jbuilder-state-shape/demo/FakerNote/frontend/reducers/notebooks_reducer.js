import merge from 'lodash/merge';

const NotebooksReducer = (state = [], action) => {
	switch (action.type) {
		case 'RECEIVE_NOTEBOOKS':
			return action.notebooks;
		case 'REMOVE_NOTEBOOKS':
			return [];
		default:
			return state;
	}
};
export default NotebooksReducer;


