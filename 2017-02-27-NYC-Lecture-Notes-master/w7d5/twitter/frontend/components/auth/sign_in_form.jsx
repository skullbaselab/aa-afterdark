import React, { Component } from 'react';
import { Link } from 'react-router';
import { connect } from 'react-redux';
import { signIn, receiveErrors } from '../../actions/session_actions';
import ErrorList from '../shared/error_list';
import AuthForm from './auth_form';

class SignInForm extends Component {
  render() {
    return(
      <AuthForm
        processForm={this.props.signIn}
        clearErrors={this.props.clearErrors}
        errors={this.props.errors}
        actionText="Sign in"
        altAction="Sign up"
        altPath="/users/new"
      />
    );
  }
}

function mapStateToProps({ session: { errors } }) {
  return { errors };
}

function mapDispatchToProps(dispatch) {
  return {
    signIn: (user) => dispatch(signIn(user)),
    clearErrors: () => dispatch(receiveErrors({}))
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SignInForm);
