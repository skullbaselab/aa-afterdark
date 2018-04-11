import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
    };

    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return (e) => this.setState({
      [field]: e.currentTarget.value
    });
  }

  renderErrors() {
    let errors = [];
    this.props.errors.forEach( (err, idx) => {
      errors.push(<li key={`${idx}`}>{err}</li>);
    });

    return (
      <ul>
        {errors}
      </ul>
    );
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = this.state;
    this.props.submit({user});
  }

  render() {

    return (
      <div className="auth-form-container">
        {this.renderErrors()}
          <form onSubmit={this.handleSubmit} className="auth-form-box">
            <div className="auth-group">
              <input type="text"
                  value={this.state.email}
                  onChange={this.update('username')}
                  className="login-input"
                />
              <span className="bar" />
              <label>Username</label>
            </div>

            <div className="auth-group">
                <input type="password"
                  value={this.state.password}
                  onChange={this.update('password')}
                  className="login-input"
                />
                <span className="bar" />
                <label>Password</label>
            </div>

            <input type="submit" value={this.props.buttonText} />

          </form>
        </div>
    );
  }
}

export default SessionForm;
