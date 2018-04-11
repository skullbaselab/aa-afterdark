import React from 'react';
import {connect} from 'react-redux';
import {login, signup} from '../actions/session_actions';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state =  {
      username: '',
      password: ''
    };

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    return e => {
      this.setState({[field]: e.currentTarget.value});
    };
  }

  handleSubmit(e) {
    // debugger
    e.preventDefault();
    const user = this.state;
    this.props.processForm({user});
  }

  render() {
    const buttonText = this.props.formType === 'login' ? 'Log In' : 'Sign Up';
    return (
      <section className="form-wrapper">

        <form onSubmit={this.handleSubmit}>
          <label>
            Username:
            <input onChange={this.update("username")} value={this.state.username}/>
          </label>
          <label>
            Password:
            <input onChange={this.update("password")}
              value={this.state.password}
              type="password"
              />
          </label>
          <button>{buttonText}</button>
        </form>
      </section>
    );
  }
}


const mapDispatchToProps = function(dispatch, ownProps) {
  const formType = ownProps.location.pathname.slice(1);
    const processForm = (formType === 'login') ? login : signup;
    return {
      processForm: user => {
        // debugger;
        return dispatch(processForm(user));
      },
      formType
    };
};

export default connect(null, mapDispatchToProps)(SessionForm);
