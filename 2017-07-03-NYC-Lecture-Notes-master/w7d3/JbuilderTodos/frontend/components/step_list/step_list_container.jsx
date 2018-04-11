import { connect } from 'react-redux';
import StepList from './step_list';
// Actions
import { stepsByTodoId } from '../../reducers/selectors';
import { createStep } from '../../actions/step_actions';

// second argument to mapStateToProps is ownProps
const mapStateToProps = (state, { stepIds }) => ({
  steps: stepIds.map( (stepId) => {
    if (state.steps[stepId]) {
      return state.steps[stepId];
    } else {
      return null;
    }
  })
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  createStep: (...args) => dispatch(createStep(...args))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(StepList);
