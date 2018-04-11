const React = require("react");

const KeyActions = require("../actions/key_actions");
const KeyStore = require("../stores/key_store");

module.exports = React.createClass({
  getInitialState(){
    return ({
      keyCodes: []
    });
  },

  componentDidMount(){
    KeyStore.addListener(this._handleChange);
    document.addEventListener("keydown", this._handleKeyDown);
    document.addEventListener("keyup", this._handleKeyUp);
  },

  _handleChange(){
    this.setState({keyCodes: KeyStore.keyCodes()});
  },

  _handleKeyDown(event){
    const keyCode = event.code;
    KeyActions.addKey(keyCode);
  },

  _handleKeyUp(event){
    const keyCode = event.code;
    KeyActions.removeKey(keyCode);
  },

  _generateList(){
    return this.state.keyCodes.map( code => (
      <li key={code}>{code}</li>
    ));
  },
  render(){
    return(
      <ul>
        {this._generateList()}
      </ul>
    );
  }
});
