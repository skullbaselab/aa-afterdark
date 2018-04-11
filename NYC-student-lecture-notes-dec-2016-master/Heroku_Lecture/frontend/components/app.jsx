import React, { Component } from 'react';
import TweetIndex from './tweet_index';
import TweetForm from './tweet_form';


const App = ({ children }) => {
  return (
    <section>
      <img src={window.images.twitterLogo}/>
      { children }
    </section>
  );
};

export default App;

// class App extends Component {
//
//   fetchTweets() {
//     this.props.fetchTweets();
//   }
//
//   componentDidMount() {
//     // this.props.fetchTweets();
//     this.fetchTweets();
//   }
//
//   render() {
//     const { fetching, tweets, children } = this.props;
//     if (fetching) return <Spinner />;
//     return (
//       <main>
//         {this.props.children}
//         <h1>Tweetstagram</h1>
//         <TweetForm />
//         <TweetIndex tweets={ tweets } />
//       </main>
//     );
//   }
//
// }
//
// function mapStateToProps(state) {
//   return { fetching: state.fetching, tweets: allTweets(state) };
// }
//
// function mapDispatchToProps(dispatch) {
//   return { fetchTweets: () => dispatch(fetchTweets()) };
// }
//
// export default connect(mapStateToProps, mapDispatchToProps)(App);
