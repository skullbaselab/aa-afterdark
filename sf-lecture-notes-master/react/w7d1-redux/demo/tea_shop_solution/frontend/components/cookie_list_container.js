import { connect } from 'react-redux';
import { addCookie } from '../actions/cookie_actions';

import CookieList from './cookie_list';

const mapStateToProps = state => ({
  cookies: state.cookies
});

const mapDispatchToProps = dispatch => ({
  addCookie: cookie => dispatch(addCookie(cookie))
});

export default connect(mapStateToProps, mapDispatchToProps)(CookieList);
