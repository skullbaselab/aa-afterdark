import React from 'react'
import TweetIndex from './tweets/tweet_index/tweet_index_container'
import LoginForm from './auth/login_form_container'
import SignUpForm from './auth/signup_form_container'
import Header from './header'
import { AuthRoute, ProtectedRoute } from '../util/route_util'
import { Route, Switch } from 'react-router-dom'

const App = () => {
  return (
    <main>
      <Header />
      <img src={window.blue} />
      <Switch>
        <AuthRoute path="/login" component={LoginForm} />
        <AuthRoute path="/signup" component={SignUpForm} />
        <ProtectedRoute path="/tweets" component={TweetIndex} />
      </Switch>
    </main>
  )
}

export default App
