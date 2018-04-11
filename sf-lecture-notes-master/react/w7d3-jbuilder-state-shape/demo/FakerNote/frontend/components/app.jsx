import React from 'react';
import {Provider} from 'react-redux';
import Home from './home';
import {Router, Route, hashHistory, IndexRedirect, IndexRoute} from 'react-router';
import UsersContainer from './users_container';
import NotebooksContainer from './notebooks_container';
import Splash from './splash';
import BlankNotebook from './blank_notebook';

import {requestNotebooks, removeNotebooks} from '../actions/actions';

const App = ({store}) => {
	const requestNotebooksOnEnter = (nextState) => {
		debugger;
		store.dispatch(requestNotebooks(nextState.params.userId));
	};
	const removeNotebooksOnLeave = () => {
		store.dispatch(removeNotebooks());
	};

	return (
		<Provider store={store}>
			<Router history={hashHistory}>
				<Route path="/" component={Home}>
					<IndexRedirect to="/welcome" />
					<Route path="/welcome" component={Splash}/>
					<Route path="users" component={UsersContainer}>
						<IndexRoute component={BlankNotebook}/>
						<Route path=":userId/notebooks"
									 component={NotebooksContainer}
									 onEnter={requestNotebooksOnEnter}
									 onLeave={removeNotebooksOnLeave}/>
					</Route>
				</Route>
			</Router>
		</Provider>
	);
};

export default App;
