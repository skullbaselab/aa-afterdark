const React = require('react');

module.exports = React.createClass({
  componentWillMount: function () {
    console.log("CounterDisplay: component will mount");
  },
  componentDidMount: function () {
    console.log("CounterDisplay: component did mount");
  },
  componentWillReceiveProps: function () {
    console.log("CounterDisplay: component will receive props");
  },
  componentWillUpdate: function () {
    console.log("CounterDisplay: component will update");
  },
  componentDidUpdate: function () {
    console.log("CounterDisplay: component did update");
  },
  componentWillUnmount: function () {
    console.log("CounterDisplay: component will unmount");
  },
  render: function () {
    return (
      <p>{this.props.count}</p>
    );
  }
});
