import React from 'react';
// Components
import StepListItemContainer from './step_list_item_container';
import StepForm from './step_form';

const StepList = ({ steps, todo_id, createStep }) => {
  const stepItems = steps.map(step => {
    if (step) {
      return (<StepListItemContainer
      key={step.id}
      step={step} />
  )} else {
    return null;
    }
  }
);

  return (
    <div>
      <ul className="step-list">
        { stepItems }
      </ul>
      <StepForm todo_id={ todo_id } createStep={ createStep } />
    </div>
  )
};

export default StepList;
