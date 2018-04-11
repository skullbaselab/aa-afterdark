var Buttons = React.createClass({
  render: function(){
    var button1, button2;
    if (this.props.running){
      button1 = "stop";
      button2 = "split";
    } else {
      button1 = "start";
      button2 = "reset";
    }
    return (
      <div className="buttons">
        <button onClick={this.props.btn1Click}>{button1}</button>
        <button onClick={this.props.btn2Click}>{button2}</button>
      </div>
    );
  }
});

var Splits = React.createClass({
  render: function(){
    return (
      <ul>
      {
        this.props.splits.map(function(split){
          return <li>{split}</li>;
        })
      }
      </ul>
    );
  }
});

var Watch = React.createClass({
  getInitialState: function(){
    return {elapsed: 0, running: true, splits: []};
  },
  componentDidMount: function(){
    this.intervalId = setInterval(this._tick, 10);
  },
  componentWillUnmount: function(){
    clearInterval(this.intervalId);
  },
  handleButton1Click: function(){
    if (this.state.running){
      this.setState({running: false});
    } else {
      this.setState({running: true});
    }
  },
  handleButton2Click: function(){
    if (this.state.running){
      var newSplit = this.state.elapsed.toFixed(2);
      var splits = this.state.splits;
      splits.push(newSplit);
      this.setState({splits: splits});
    } else {
      this.setState({elapsed: 0, splits: []});
    }
  },
  _tick: function(){
    // this.state.elapsed += 0.01; // WONT CALL RENDER
    if (this.state.running) {
      var oldElapsed = this.state.elapsed;
      oldElapsed += 0.01;
      this.setState({elapsed: oldElapsed});
    }
  },
  render: function(){
    return (
      <div className="theWatch">
        <div className="display">{this.state.elapsed.toFixed(2)}</div>
        <Buttons
          btn1Click={this.handleButton1Click}
          btn2Click={this.handleButton2Click}
          running={this.state.running}/>
        <Splits splits={this.state.splits}/>
      </div>
    );
  }
});

React.render(<Watch/>, document.getElementById('watch'));
