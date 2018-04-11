import React from "react";
import { connect } from "react-redux";
import { receiveTweet, createTweet } from "../../../actions/tweet_actions";
import TweetForm from "./tweet_form";

//  You don't HAVE to use mapStateToProps
// const mapStateToProps = (state) => {
//   return {
//     // numTweets: Object.keys(state.tweets).length
//   };
// };

const mapDispatchToProps = (dispatch) => {
  return {
    // receiveTweet: (tweet) => dispatch(receiveTweet(tweet)),
    createTweet: (tweet) => dispatch(createTweet(tweet))
  };
};

export default connect(null, mapDispatchToProps)(TweetForm);
