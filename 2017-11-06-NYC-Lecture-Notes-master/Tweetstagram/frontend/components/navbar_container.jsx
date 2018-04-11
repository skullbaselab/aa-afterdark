import { connect } from 'react-redux';
import Navbar from './navbar';

const mapStateToProps = (state) => {
  return {
    currentUser: state.session.currentUser,
  };
};

export default connect(mapStateToProps, null)(Navbar);
