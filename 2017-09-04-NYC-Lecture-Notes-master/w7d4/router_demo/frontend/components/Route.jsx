import React from 'react';

const Route = ({ path, component }) => {
  const Component = component;
  const [domain, hashPath] = window.location.href.split('#');
  return path === hashPath ? <Component /> : null;
}

export default Route;
