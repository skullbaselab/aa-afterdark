import React from 'react';
import TweetIndex from './tweet_index';
import UserShow from './user_show';
import ListIndex from './list_index';
import ListShow from './list_show';
import LoginForm from './login_form';
import SignupForm from './signup_form';
import TweetForm from './tweet_form';
import { Route, Switch, NavLink, Link } from 'react-router-dom';
import { ProtectedRoute, AuthRoute } from '../util/route_util';

const Header = () => (
  <div>
    <h1 className="logo"><a>Tweet Academy</a></h1>
    <Link to="/"><img className='logo-image' src={ window.staticImages.twitterLogo } /></Link>
    <div className="site-header">
      <nav>
        <NavLink to="/tweets" activeClassName="active-nav-link" >
          ALL TWEETS
        </NavLink>
        <NavLink to="/lists" activeClassName="active-nav-link" >
          ALL LISTS
        </NavLink>
        <Link to="/login">Login</Link>
        <Link to="/signup">Sign Up</Link>
      </nav>
    </div>
  </div>
);

const App = () => (
  <div>
    <Header />
    <Route path="/users/:userId" component={UserShow} />
    <Route path="/lists/:listId" component={ListShow} />
    <Route path="/lists" exact component={ListIndex} />
    <Route path="/" exact component={TweetIndex} />
    <Route path="/tweets" component={TweetIndex} />
    <ProtectedRoute path="/maketweet" component={TweetForm} />
    <AuthRoute path="/login" component={LoginForm} />
    <AuthRoute path="/signup" component={SignupForm} />
  </div>
);

export default App;
