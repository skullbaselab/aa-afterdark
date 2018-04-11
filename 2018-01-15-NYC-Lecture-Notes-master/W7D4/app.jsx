import React from 'react';
import { HashRouter } from 'react-router-dom';
import MyRoute from './my_route';


import Page1 from './pages/page1';
import Page2 from './pages/page2';
import Page3 from './pages/page3';
import Page4 from './pages/page4';

const App = () => (
  <HashRouter>
    <div style={{fontFamily: 'sans-serif', textAlign: 'center'}}>
      <h1>React Router!</h1>

      <nav style={{display: 'flex', flexDirection: 'column'}}>
        <a href="#/page1">page 1</a>
        <a href="#/page2">page 2</a>
        <a href="#/page3">page 3</a>
        <a href="#/page4">page 4</a>
      </nav>

      <MyRoute path="/page1" component={Page1} />
      <MyRoute path="/page2" component={Page2} />
      <MyRoute path="/page3" component={Page3} />
      <MyRoute path="/page4" component={Page4} />
    </div>
  </HashRouter>
);

// class App extends React.Component {
//   constructor(props) {
//     super(props);
//
//     this.state = { page: null };
//   }
//
//   handlePageChange(pageNumber) {
//     return (e) => {
//       
//       this.setState({page: pageNumber});
//     };
//   }
//
//   render() {
//     
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
//
//       default:
//         Page = 'div';
//     }
//
//     return (
//       <div style={{fontFamily: 'sans-serif', textAlign: 'center'}}>
//         <h1>React Router!</h1>
//
//         <nav style={{display: 'flex', flexDirection: 'column'}}>
//           <a href="#" onClick={this.handlePageChange(1)}>page 1</a>
//           <a href="#" onClick={this.handlePageChange(2)}>page 2</a>
//           <a href="#" onClick={this.handlePageChange(3)}>page 3</a>
//           <a href="#" onClick={this.handlePageChange(4)}>page 4</a>
//         </nav>
//
//         <Page />
//       </div>
//     );
//   }
// }

export default App;
