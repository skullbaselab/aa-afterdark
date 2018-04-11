import { connect } from 'react-redux';

import { addHotDog } from '../../actions/hotDogActions';
import HotDogs from './hot_dogs';

const mapStateToProps = ({ hotDogs }) => {

  return { hotDogs }
};

const mapDispatchToProps = (dispatch) => {
  return {
    addHotDog: () => dispatch(addHotDog())
  }
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(HotDogs)
