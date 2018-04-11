import React from 'react';
import { connect } from 'react-redux';
import { Switch, Route } from 'react-router-dom';

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
        <Route exact path='/' component={CatIndex} />
        <Route exact path='/cats' component={CatIndex} />
        <Route path='/cats/:id' component={CatShow} />
        <FourZeroFour />
      </Switch>
    </main>
  </div>
);

export default App;

// <Route component={FourZeroFour} />
// <CatIndex cats={ cats }/>
// <CatShow catId={ 1 }/>
// <FourZeroFour/>
