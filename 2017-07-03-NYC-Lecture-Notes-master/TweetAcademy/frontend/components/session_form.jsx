import React from 'react';

export default class SessionForm extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      username: '',
      password: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(field) {
    return (e) => this.setState({ [field]: e.currentTarget.value });
  }

  handleSubmit(e) {
    e.preventDefault();

    const user = Object.assign({}, this.state);

    this.props.submit(user);
  }

  render() {
    return (
      <form onSubmit={ this.handleSubmit }>
        <label htmlFor="username">Username</label>
        <input
          type="text"
          id="username"
          onChange={ this.handleChange('username') }
          value={ this.state.username }
        />

        <label htmlFor="password">Password</label>
        <input
          type="text"
          id="password"
          onChange={ this.handleChange('password') }
          value={ this.state.password }
        />

        <button>{ this.props.buttonText }</button>
      </form>
    );
  }
}
