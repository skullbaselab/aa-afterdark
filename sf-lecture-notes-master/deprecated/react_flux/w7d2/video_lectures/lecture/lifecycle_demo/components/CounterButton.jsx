const React = require('react');

module.exports = React.createClass({
  componentWillMount: function () {
    console.log("CounterButton: component will mount");
  },
  componentDidMount: function () {
    console.log("CounterButton: component did mount");
  },
  componentWillReceiveProps: function () {
    console.log("CounterButton: component will receive props");
  },
  componentWillUpdate: function () {
    console.log("CounterButton: component will update");
  },
  componentDidUpdate: function () {
    console.log("CounterButton: component did update");
  },
  componentWillUnmount: function () {
    console.log("CounterButton: component will unmount");
  },
  render: function () {
    return (
      <div>
        <button onClick={this.props.handleClick}>Click</button>
      </div>
    );
  }
});
