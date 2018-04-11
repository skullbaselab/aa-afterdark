import { connect } from 'react-redux';
import { signUp } from '../actions/session_actions';
import SignUpForm from './sign_up_form';

const mapDispatchToProps = dispatch => {
  return {
    signUp: user => dispatch(signUp(user))
  };
};

// can't put debugger in this one
const mapDispatchToPropsButImplicitReturn = dispatch => ({
    signUp: user => dispatch(signUp(user))
});

export default connect(null, mapDispatchToProps)(SignUpForm);
