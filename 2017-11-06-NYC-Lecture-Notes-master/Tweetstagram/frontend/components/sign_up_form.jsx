import React from 'react';

export default class SignUpForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleInput = this.handleInput.bind(this);
  }

  handleInput(type) {
    // this returned function is the actual onChange callback for our inputs
    return e => {
      this.setState({[type]: e.target.value});
    };
  }

  // the event is always passed in to event handlers
  handleSubmit(e) {
    e.preventDefault();
    this.props.signUp(this.state).then(() => {
      // we're only clearing the username and password on success
      this.setState({username: '', password: ''});
      this.props.history.push('/');
    });
  }



  render() {
    return (

      <form onSubmit={this.handleSubmit}>
        <input type="text"
          value={this.state.username}
          onChange={this.handleInput('username')}/>

        <input type="password"
          value={this.state.password}
          onChange={this.handleInput('password')}/>
        <button>Sign Up!</button>
      </form>
    );
  }
}






"hey"
