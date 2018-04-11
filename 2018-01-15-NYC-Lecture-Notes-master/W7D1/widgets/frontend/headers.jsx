import React from 'react';

export default function Headers(props) {

  function chooseSpecificTab(idx) {
    return (e) => {
      props.onTabChosen(idx);
    };
  }

  let selected = props.selectedPane;
  let headers = props.panes.map((pane, index) => {
    let title = pane.title;
    let klass = '';
    if (index === selected) {
      klass = 'active';
    }

    return (
      <li
        key={index}
        className={klass}
        onClick={chooseSpecificTab(index)}>
        {title}{' '}
      </li>
    );
  });
  return (
    <ul className='tab-header'>
      {headers}
    </ul>

  );
}
