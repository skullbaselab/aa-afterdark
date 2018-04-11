import React from 'react';
import { connect } from 'react-redux';

const About = props => (
  <p>{props.cat.description}</p>
);

const mapStateToProps = (state, ownProps) => ({
  cat: state.cats[ownProps.match.params.id],
});

export default connect(mapStateToProps)(About);
