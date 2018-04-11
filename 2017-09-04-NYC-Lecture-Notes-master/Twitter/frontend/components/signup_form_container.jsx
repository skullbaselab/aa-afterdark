import { connect } from 'react-redux';
import { signup } from '../actions/session_actions';
import SessionForm from './session_form';

const mapDispatchToProps = (dispatch) => {
  return {
    submit: (user) => dispatch(signup(user)),
  };
};

const mapStateToProps = (state, ownProps) => {
  return {
    errors: state.session.errors,
    buttonText: "Signup!!@#$"
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
