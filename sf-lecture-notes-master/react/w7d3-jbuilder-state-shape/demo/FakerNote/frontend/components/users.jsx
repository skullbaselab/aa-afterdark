import React from 'react';
import {withRouter, Link} from 'react-router';

class Users extends React.Component {
	componentDidMount() {
		this.props.requestUsers();
	}

	render() {
		return (
			<section className="main">
				<ul className="user-list">
				{this.props.users.map((user, index)=> {
					return (
						<li className="user" key={user.username + index}>
							<Link to={`/users/${user.id}/notebooks`}>
								<section>
									<img src={user.image_url} alt={user.username}/>
									<span>{user.username}</span>
								</section>
							</Link>
						</li>
						);
					})
				}
				</ul>
				{this.props.children}
			</section>
		);
	}
}

export default withRouter(Users);
