import { connect } from 'react-redux';
import { signup } from '../actions/session_actions';
import SessionForm from './session_form';

const mapDispatchToProps = (dispatch) => {
  return {
    submit: user => dispatch(signup(user)),
    buttonText: 'Sign Up',
  };
};

export default connect(null, mapDispatchToProps)(SessionForm);
