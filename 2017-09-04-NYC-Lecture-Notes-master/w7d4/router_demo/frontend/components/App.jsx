import React from 'react';
import TweetIndex from './TweetIndex';
import TweetForm from './TweetForm';
import Tweet from './Tweet';
import { Route, Switch, Redirect } from 'react-router-dom';

const App = () => {
  return (
    <div>
      <h1>Tweetstagram</h1>
      <Switch>
        <Route path='/tweets/:id' component={Tweet} />
        <Route path='/tweets' component={TweetIndex} />
        <Route path='/:dumbRoute' render={(props) => {
            props.history.push('/tweets');
            return null;
          }} />
      </Switch>
    </div>
  );
};

export default App;
