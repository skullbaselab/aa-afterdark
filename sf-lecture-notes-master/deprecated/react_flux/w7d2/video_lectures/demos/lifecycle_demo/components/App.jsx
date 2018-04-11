const React = require('react');

const CounterDisplay = require('./CounterDisplay');
const CounterButton = require('./CounterButton');

module.exports = React.createClass({
  getInitialState: function () {
    return {count: 0};
  },
  componentWillMount: function () {
    console.log("App: component will mount");
  },
  componentDidMount: function () {
    console.log("App: component did mount");
  },
  componentWillReceiveProps: function () {
    console.log("App: component will receive props");
  },
  componentWillUpdate: function () {
    console.log("App: component will update");
  },
  componentDidUpdate: function () {
    console.log("App: component did update");
  },
  componentWillUnmount: function () {
    console.log("App: component will unmount");
  },
  incrementCount: function () {
    console.log("App: increment count");
    this.setState({count: this.state.count + 1});
  },
  render: function () {
    return (
      <div>
        <h1>App</h1>
        <CounterDisplay count={this.state.count}/>
        <CounterButton handleClick={this.incrementCount}/>
      </div>
    );
  }
});
