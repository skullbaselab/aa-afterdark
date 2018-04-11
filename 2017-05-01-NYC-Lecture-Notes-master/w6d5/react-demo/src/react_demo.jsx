import React from 'react';
// we need React because we use JSX below

import ReactDOM from 'react-dom';
import App from './app';

// example of importing from files that export more than one thing:
// import * as Thingies from './thingies';
// import { thingOne, thingTwo } from './thingies';

const root = document.getElementById('content');

ReactDOM.render(<App />, root);
