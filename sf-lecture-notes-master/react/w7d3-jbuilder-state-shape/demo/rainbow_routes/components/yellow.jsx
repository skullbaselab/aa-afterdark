import React from 'react';
import {withRouter} from 'react-router';

const Yellow = ({params}) => (
  <div>
    <h3 className="yellow"></h3>
    <h4>{`"I Love ${params.code}"`}</h4>
  </div>
);

export default Yellow;
