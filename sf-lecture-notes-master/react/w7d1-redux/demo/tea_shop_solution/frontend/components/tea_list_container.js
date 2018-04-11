import { connect } from 'react-redux';
import { addBlackTea, addOolongTea, addGreenTea } from '../actions/tea_actions';
import TeaList from './tea_list';

const mapStateToProps = (state) => {
  // debugger
  return { teas: state.teas };
};

const mapDispatchToProps = dispatch => ({
  addBlackTea: () => dispatch(addBlackTea()),
  addOolongTea: () => dispatch(addOolongTea()),
  addGreenTea: () => dispatch(addGreenTea())
});

export default connect(mapStateToProps, mapDispatchToProps)(TeaList);
