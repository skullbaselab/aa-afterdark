import React from 'react';
import { withRouter } from 'react-router-dom';

const MyRoute = props => {
  const Component = props.component;
  const [domain, relPath] = window.location.href.split('#');
  return relPath === props.path ?
    <Component/> : null;
}

const MyRoute2 = props => {
  debugger
  const Component = props.component;
  return props.path === props.location.pathname ?
    <Component/> : null;
}

// export default MyRoute;
export default withRouter(MyRoute2);
