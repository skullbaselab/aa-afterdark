import React from 'react';
import { connect } from 'react-redux';
import { Route, Switch } from 'react-router-dom';

import CatIndex from './CatIndex';
import CatShow from './CatShow';
import FourZeroFour from './FourZeroFour';
import Header from './Header';
import MyRoute from './MyRoute';

const App = ({ cats }) => (
  <div>
    <Header/>
    <main>
      <Switch>
        <Route exact path='/' component={ CatIndex }/>
        <Route exact path='/cats' component={ CatIndex }/>
        <Route path='/cats/:id' component={ CatShow }/>
        <FourZeroFour/>
      </Switch>
      {/*<MyRoute path='/404' component={FourZeroFour}/>*/}
    </main>
  </div>
);

export default App;
