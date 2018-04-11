import { connect } from 'react-redux';
import App from './app';
import { requestDate } from '../actions/date_actions';

const mapStateToProps = state => ({
  dateFacts: state.dates.dateFacts,
  loading: state.dates.loading
});

const mapDispatchToProps = dispatch => ({
  requestDate: () => dispatch(requestDate())
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(App);
