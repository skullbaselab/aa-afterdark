"use strict";

const React = require("react");

const Currency = React.createClass({
  render() {
    let color = "red";
    if(this.props.rate > 1) {
      color = "green";
    }

    return (<div className={color}>
              {this.props.name}
              &nbsp;
              {this.props.rate}
            </div>);
  }
});

module.exports = Currency;
