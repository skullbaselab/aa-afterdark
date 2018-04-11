import { connect } from 'react-redux';
import { addHotDog } from '../../actions/hot_dog_actions';
import HotDogStand from './hot_dogs';

const mapStateToProps = (state) => {
  return ({
    hotDogs: state.hotDogs
  });
};

const mapDispatchToProps = (dispatch) => {
  return ({
    addHotDog: () => { dispatch(addHotDog()); }
  });
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(HotDogStand);
