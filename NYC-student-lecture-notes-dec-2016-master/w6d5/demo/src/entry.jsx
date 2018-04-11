import React from 'react';
import ReactDOM from 'react-dom';
import App from './app';

const root = document.getElementById("content");
ReactDOM.render(<App />, root);
// RENDERING A NATIVE TAG

// ReactDOM.render(<h1>Hello, world!</h1>, root);

// ReactDOM.render(React.createElement("h1", {}, "Hello, world!"), root);


// RENDERING A FUNCTIONAL COMPONENT

// function Heading({ message, className }) {
//   return (
//     <h1
//       className={ className }
//       onClick={ () => alert('clicked!') }
//     >
//       { message }
//     </h1>
//   );
// }
// const thing = "Hello, world";
// ReactDOM.render(<Heading message={ thing } className="greeting2"/>, root);

// ReactDOM.render(React.createElement(Heading, { message }), root);
