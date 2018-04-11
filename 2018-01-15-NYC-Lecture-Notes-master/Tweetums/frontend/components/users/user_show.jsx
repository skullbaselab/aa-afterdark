import React, { Component } from 'react'
import { connect } from 'react-redux'
import Tweet from '../tweets/tweet/tweet'
import { fetchTweets } from '../../actions/tweet_actions'

class UserShow extends Component {
  componentDidMount() {
    this.props.fetchTweets()
  }

  render() {
    const tweets = this.props.tweets.map(tweet => {
      return (
        <Tweet
          tweet={tweet}
          key={tweet.id}
          author={this.props.author}
        />
      )
    })
    return (
      <main>
        <h3>User #(id number here) Tweets</h3>
        <ul>{tweets}</ul>
      </main>
    )
  }
}

const mapStateToProps = (state, ownProps) => {
  const author = state.users[ownProps.match.params.id]
  const tweets = Object.values(state.tweets).filter(tweet => {
    return tweet.author_id === author.id
  })
  return {
    author: author,
    tweets: tweets
  }
}

const mapDispatchToProps = dispatch => {
  return {
    fetchTweets: () => dispatch(fetchTweets())
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(UserShow)
