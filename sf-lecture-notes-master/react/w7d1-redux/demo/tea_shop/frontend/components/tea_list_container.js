import { connect } from 'react-redux';
import { addBlackTea, addOolongTea, addGreenTea } from '../actions/tea_actions';
import TeaList from './tea_list';

const mapStateToProps = (state) => ({
  teas: state
});

const mapDispatchToProps = (dispatch) => ({
  addOolongTea: () => dispatch(addOolongTea()),
  addBlackTea: () => dispatch(addBlackTea()),
  addGreenTea: () => dispatch(addGreenTea())
});



export default connect(mapStateToProps, mapDispatchToProps)(TeaList);