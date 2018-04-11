import React, { Component } from 'react';
import { Link } from 'react-router';
import { connect } from 'react-redux';
import { signUp, receiveErrors } from '../actions/session_actions';
import AuthForm from './auth_form';

class SignUpForm extends Component {

  componentDidMount() {
    this.props.clearErrors();
  }

  render() {
    const { signUp, errors } = this.props;
    return (
      <section>
        <h1>Sign up for Tweetstagram</h1>
        <AuthForm submitText="Sign up" submitForm={ signUp } errors={ errors }/>
        <Link to="/session/new">Sign in instead</Link>
      </section>
    );
  }
}

function mapStateToProps({ session: { errors } }) {
  return { errors };
}

function mapDispatchToProps(dispatch) {
  return {
    signUp: (user) => dispatch(signUp(user)),
    clearErrors: () => dispatch(receiveErrors({}))
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SignUpForm);
