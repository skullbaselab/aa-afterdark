import { connect } from 'react-redux';
import { login } from '../actions/session_actions';
import SessionForm from './session_form';

const mapDispatchToProps = (dispatch) => {
  return {
    submit: user => dispatch(login(user)),
    buttonText: 'Log In', // al loves trailing commas :)
                          // also they make for good git diffs
                          // also AirBnB said so
  };
};

export default connect(null, mapDispatchToProps)(SessionForm);
