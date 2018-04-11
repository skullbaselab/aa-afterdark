import React from 'react';
import Page1 from './lyrics/page1';
import Page2 from './lyrics/page2';
import Page3 from './lyrics/page3';
import Page4 from './lyrics/page4';
import MyRoute2 from './MyRoute';
import { HashRouter } from 'react-router-dom';

const App = () => (
  <HashRouter>
    <div>
      <h1>Bohemian Route City</h1>
      <MyRoute2 path="/1" component={Page1} />
      <MyRoute2 path="/2" component={Page2} />
      <MyRoute2 path="/3" component={Page3} />
      <MyRoute2 path="/4" component={Page4} />
    </div>
  </HashRouter>
);

// class App extends React.Component {
//   constructor(props) {
//     super(props);
//
//     this.state = { page: 1 };
//   }
//
//   handlePageChange(pageNumber) {
//     return (e) => this.setState({page: pageNumber})
//   }
//
//   render() {
//     let Page;
//     switch (this.state.page) {
//       case 1:
//         Page = Page1;
//         break;
//
//       case 2:
//         Page = Page2;
//         break;
//
//       case 3:
//         Page = Page3;
//         break;
//
//       case 4:
//         Page = Page4;
//         break;
//     }
//     return (
//       <div>
//         <h1>Bohemian Route City</h1>
//         <ul>
//           <li onClick={this.handlePageChange(1)}>page 1</li>
//           <li onClick={this.handlePageChange(2)}>page 2</li>
//           <li onClick={this.handlePageChange(3)}>page 3</li>
//           <li onClick={this.handlePageChange(4)}>page 4</li>
//         </ul>
//
//         <Page />
//       </div>
//     );
//   }
// }

export default App;
