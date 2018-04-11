import React from 'react';
import { Link, withRouter } from 'react-router';

class SessionForm extends React.Component {
	constructor(props) {
		super(props);
		this.state = { username: "", password: "" };
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	update(field) {
		return e => this.setState({
			[field]: e.currentTarget.value
		});
	}

	handleSubmit(e) {
		e.preventDefault();

    const user = Object.assign({}, this.state);

    this.props.signup(user)
      .then(() => this.props.router.push('/tweets'));
      
		// TODO
		// sign up the current user
		// then redirect to the tweets index
	}

	renderErrors() {
		return(
			<ul>
				{this.props.errors.map((error, i) => (
					<li key={`error-${i}`}>
						{error}
					</li>
				))}
			</ul>
		);
	}

	render() {
		return (
			<div>
				<h1>Sign Up</h1>
				<form className="login-form" onSubmit={this.handleSubmit}>
					{this.renderErrors()}

						<label> Username:
							<input type="text"
								value={this.state.username}
								onChange={ this.update("username") }/>
						</label>

						<label> Password:
							<input type="password"
								value={this.state.password}
								onChange={ this.update("password") }/>
						</label>

						<input type="submit" value="Submit" />
				</form>
			</div>
		);
	}

}

export default withRouter(SessionForm);
