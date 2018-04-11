import React from 'react'
import Tweet from '../tweet/tweet'
import TweetForm from '../tweet_form/tweet_form_container'

class TweetIndex extends React.Component {
  componentDidMount() {
    this.props.fetchTweets()
  }

  render() {
    const tweets = this.props.tweets.map(tweet => {
      const author = this.props.users[tweet.author_id]
      return (
        <li key={tweet.id}>
          <Tweet
            tweet={tweet}
            author={author}
            destroyTweet={this.props.destroyTweet}
            isCurrentUserTweet={this.props.currentUserId === tweet.author_id}
          />
        </li>
      )
    })

    return (
      <section className="tweet-index">
        <TweetForm />
        <ul>{tweets}</ul>
      </section>
    )
  }
}

export default TweetIndex
