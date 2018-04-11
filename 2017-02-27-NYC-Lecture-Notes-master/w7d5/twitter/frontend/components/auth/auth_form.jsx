import React, { Component } from 'react';
import { Link, withRouter } from 'react-router';
import ErrorList from '../shared/error_list';

class AuthForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleUsernameChange = this.handleUsernameChange.bind(this);
    this.handlePasswordChange = this.handlePasswordChange.bind(this);
  }

  componentDidMount() {
    this.props.clearErrors();
  }

  handleUsernameChange(e) {
    this.setState({
      username: e.currentTarget.value
    })
  }

  handlePasswordChange(e) {
    this.setState({
      password: e.currentTarget.value
    })
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.processForm(this.state)
      .then(() => this.props.router.push('/'));
  }

  render() {
    const { actionText, altPath, altAction, errors } = this.props;

    return (
      <section>
        <h1>{actionText} for Tweetster</h1>
        <form onSubmit={ this.handleSubmit }>
          <ErrorList errors={ errors.base } />

          <label htmlFor="username">Username</label>
          <input
            type="text"
            onChange={ this.handleUsernameChange }
            value={ this.state.username }
            />
          <ErrorList errors={ errors.username } />

          <label htmlFor="password">Password</label>
          <input
            type="password"
            onChange={ this.handlePasswordChange }
            value={ this.state.password}
            />
          <ErrorList errors={ errors.password } />

          <button>{actionText}!</button>
        </form>
        <Link to={altPath}>{altAction} instead</Link>
      </section>
    );
  }

}

export default withRouter(AuthForm);
