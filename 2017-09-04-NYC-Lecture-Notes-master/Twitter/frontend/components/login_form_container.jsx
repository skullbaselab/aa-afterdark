import { connect } from 'react-redux';
import { login } from '../actions/session_actions';
import SessionForm from './session_form';

const mapDispatchToProps = (dispatch) => {
  return {
    submit: (user) => dispatch(login(user)),
  };
};

const mapStateToProps = (state) => {
  return {
    errors: state.session.errors,
    buttonText: "Login!"
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
