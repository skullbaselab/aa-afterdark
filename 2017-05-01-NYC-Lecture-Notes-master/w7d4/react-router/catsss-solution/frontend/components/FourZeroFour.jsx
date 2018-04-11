import React from 'react';
import { withRouter } from 'react-router-dom';

const FourZeroFour = props => {
  return (
    <article className='four-zero-four'>
      <img src='https://img.buzzfeed.com/buzzfeed-static/static/2014-07/9/14/enhanced/webdr10/anigif_enhanced-6128-1404931264-6.gif'/>
      <h1>404: "{props.location.pathname}" could not be found</h1>
      <button onClick={() => props.history.push('/cats')}>Take me home!</button>
    </article>
  );
};

export default withRouter(FourZeroFour);
