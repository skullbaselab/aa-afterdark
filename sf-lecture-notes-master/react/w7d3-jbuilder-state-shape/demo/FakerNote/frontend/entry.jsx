import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store';
import App from './components/app';

document.addEventListener('DOMContentLoaded', () => {
	const store = configureStore();
	window.store = store;
	const root = document.getElementById('root');
	ReactDOM.render(<App store={store}/>, root);
});
