import React from 'react';
import MyComponent from './my_component.jsx';

export default class App extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      greatTa: "Brian"
    };
  }

  render() {
    return (
      <div>
        <h1>React Demo</h1>
        <h2> { this.state.greatTa } is a great TA! </h2>
        <MyComponent maurice='super awesome' brian={ this.props.brianFunc }/>
      </div>
    );
  }
}
