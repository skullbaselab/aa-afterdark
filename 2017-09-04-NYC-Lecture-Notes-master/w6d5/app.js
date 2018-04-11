import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import UserList from './user_list';

// const Hello = ({ name, name2 }) => {
//   return (
//     <main>
//       <h2>Hello, {name} & {name2}!</h2>
//       <p>Cool stuff!!</p>
//     </main>
//   );
// };

const App = () => {
  return (
    <main>
      <h2>UserList</h2>
      <UserList />
    </main>
  );
};

document.addEventListener('DOMContentLoaded', () => {
  const root = document.querySelector('div');
  // const hello = React.createElement('h2', { className: 'alert' },
  //   'Hello, world!');
  ReactDOM.render(<App />, root);
});
