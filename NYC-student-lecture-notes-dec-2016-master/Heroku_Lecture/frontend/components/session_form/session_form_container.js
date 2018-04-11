import { connect } from 'react-redux';
import SessionForm from './session_form';
import { signup } from '../../actions/session_actions';

const mapStateToProps = (state) => {
  return {
    errors: state.session.errors,
  };
};

const mapDispatchToProps = (dispatch) => {
  // TODO
  // function to dispatch a signup action
  return {
    signup: (user) => dispatch(signup(user))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(SessionForm);
