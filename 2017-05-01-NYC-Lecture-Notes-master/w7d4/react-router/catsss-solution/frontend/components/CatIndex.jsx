import React from 'react';
import { connect } from 'react-redux';
import { Link } from 'react-router-dom';

const CatIndex = props => {
  return (
    <ul className='cat-index'>
      { props.cats.map(cat => (
        <li key={cat.id} className='cat-index-item'>
          <Link to={`/cats/${cat.id}`}>
            <img src={cat.img} alt="cat!"/>
            <h3>{cat.name}</h3>
          </Link>
        </li>
      ))}
    </ul>
  );
};

const arrayify = obj =>
  Object.keys(obj)
    .reduce((arr, key) => { arr.push(obj[key]); return arr; }, []);

const mapStateToProps = state => {
  return {
    cats: arrayify(state.cats),
  }
};

export default connect(mapStateToProps)(CatIndex);
