import React from 'react';

const Notebooks = ({notebooks}) => (
	<section className="notebooks-list">
		{
			notebooks.map((notebook, index)=> {
				return (
					<section className="notebook" key={notebook.title + index}>
						<h2>{notebook.title}</h2>
						<p>{notebook.description}</p>
					</section>
				);
			})
		}
	</section>
);

export default Notebooks;
