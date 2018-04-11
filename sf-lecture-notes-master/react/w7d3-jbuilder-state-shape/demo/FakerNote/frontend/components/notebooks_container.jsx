import {connect} from 'react-redux';
import Notebooks from './notebooks';

const mapStateToProps = (state) => ({
	notebooks: state.notebooks
});

export default connect(mapStateToProps, null)(Notebooks);
