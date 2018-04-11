import React from 'react';
import {Link} from 'react-router';

const Splash = () => (
		<section className="welcome">
			<p>
				A collection of Faker data sorted by <Link to="/users">Users</Link> and Notebooks. Written by Chuck Norris.
			</p>
			
		</section>
);

export default Splash;
