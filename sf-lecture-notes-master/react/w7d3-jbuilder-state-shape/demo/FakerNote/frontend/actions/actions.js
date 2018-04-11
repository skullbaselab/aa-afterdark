export const requestUsers = () => ({
	type: 'REQUEST_USERS'
});

export const receiveUsers = (users) => ({
	type: 'RECEIVE_USERS',
	users
});

export const requestNotebooks = (userId) => ({
	type: 'REQUEST_NOTEBOOKS',
	userId
});

export const receiveNotebooks = (notebooks) => ({
	type: 'RECEIVE_NOTEBOOKS',
	notebooks
});

export const removeNotebooks = () => ({
	type: 'REMOVE_NOTEBOOKS'
});

