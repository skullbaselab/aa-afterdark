import { connect } from 'react-redux';
import TeamList from './team_list';

const MapStateToProps = ( state ) => ({
  teams: state
});

const MapDispatchToProps = ( dispatch ) => ({ // v3
  addLeicester: () => dispatch({ type:'ADD_TEAM', teamName: 'Leicester City' })
});

export default connect(MapStateToProps, MapDispatchToProps)(TeamList); // v3
// export default connect(MapStateToProps)(TeamList); // v2