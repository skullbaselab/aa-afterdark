import React from 'react';
import { connect } from 'react-redux';

const About = props => (
  <p style={{backgroundColor: 'plum'}} >{props.cat.description}</p>
);

const mapStateToProps = (state, ownProps) => {
  const catId = ownProps.match.params.id;
  return {
    cat: state.cats[catId]
  };
};

export default connect(mapStateToProps)(About);
