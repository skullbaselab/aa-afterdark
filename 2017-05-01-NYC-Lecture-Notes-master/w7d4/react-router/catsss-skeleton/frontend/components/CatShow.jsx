import React from 'react';
import { connect } from 'react-redux';
import { Route, NavLink, Redirect } from 'react-router-dom';

import About from './About';
import Friends from './Friends';

const CatShow = ({ cat }) => {
  if (cat) {
    return (
      <article>
        <section className='cat-show'>
          <h2>{cat.name}</h2>
          <img src={cat.img}/>
        </section>
        <section className='cat-extra'>
          <ul>
            <li><NavLink activeClassName='visiting' to={`/cats/${cat.id}`}>About</NavLink></li>
            <li><NavLink activeClassName='visiting' to={`/cats/${cat.id}/friends`}>Friends</NavLink></li>
          </ul>
          <div className='cat-extra-content'>
            <Route exact path='/cats/:id' component={About} />
            <Route path='/cats/:id/friends' component={Friends} />
          </div>
        </section>
      </article>
    );
      } else {
      return (
        <Redirect to='/cats' />
      );
    }
}

const mapStateToProps = (state, ownProps) => {
  const catId = ownProps.match.params.id
  return {
  cat: state.cats[catId],
  };
};

export default connect(mapStateToProps)(CatShow);
