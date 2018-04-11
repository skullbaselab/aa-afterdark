import React from 'react';
import { connect } from 'react-redux';
import { Link, Redirect, Route } from 'react-router-dom';

import About from './About';
import Friends from './Friends';

const CatShow = ({ cat }) => {
  return cat ?
    (<article>
      <section className='cat-show'>
        <h2>{cat.name}</h2>
        <img src={cat.img}/>
      </section>
      <section className='cat-extra'>
        <ul>
          <li><Link to={`/cats/${cat.id}`}>About</Link></li>
          <li><Link to={`/cats/${cat.id}/friends`}>Friends</Link></li>
        </ul>
        <div className='cat-extra-content'>
          <Route exact path='/cats/:id' component={About}/>
          <Route path='/cats/:id/friends' component={Friends}/>
        </div>
      </section>
    </article>) :
    (<Redirect to='/cats'></Redirect>);
};

const mapStateToProps = ({ cats }, ownProps) => {
  return {
    cat: cats[ownProps.match.params.id],
  }
};

export default connect(mapStateToProps)(CatShow);
