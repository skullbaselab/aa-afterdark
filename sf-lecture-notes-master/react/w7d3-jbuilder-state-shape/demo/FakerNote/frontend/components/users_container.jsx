import {connect} from 'react-redux';
import Users from './users';
import {requestUsers} from '../actions/actions';

const mapStateToProps = (state) => ({
	users: state.users
});

const mapDispatchToProps = (dispatch) => ({
	requestUsers: () => dispatch(requestUsers())
});

export default connect(mapStateToProps, mapDispatchToProps)(Users);
