import React from 'react';
import { connect } from 'react-redux';
import TweetIndexItem from './tweet_index_item';
import { requestSingleUser } from '../actions/user_actions';
import { selectTweets, selectLists } from '../reducers/selectors';
import { NavLink, Route, Link } from 'react-router-dom';

class UserShow extends React.Component {

  componentDidMount() {
    this.props.requestSingleUser(this.props.match.params.userId);
  }

  componentWillReceiveProps(nextProps) {
    if (this.props.match.params.userId !== nextProps.match.params.userId){
      this.props.requestSingleUser(nextProps.match.params.userId);
    }
  }

  renderTweets() {
    const tweets = this.props.tweets.map(tweet => {
      return (
        <TweetIndexItem
          key={tweet.id}
          tweet={tweet}
          author={this.props.user}
        />
      );
    });

    return (
      <ul>
        {tweets}
      </ul>
    );
  }

  renderLists() {
    const lists = this.props.lists.map(list => {
      return (
        <li key={list.id}>
          <Link to={`/lists/${list.id}`} >
            {list.title}
          </Link>
        </li>
      );
    });

    return (
      <ul>
        {lists}
      </ul>
    );
  }

  render() {
    const { user } = this.props;
    if (!user) {
      return null;
    }

    return (
      <div>
        <section className="user-card">
          <h3>{user.username}</h3>
          <p>Location: {user.country}</p>
          <NavLink to={`/users/${user.id}`} exact activeClassName="active-nav-link" >
            Tweets
          </NavLink>
          <NavLink to={`/users/${user.id}/lists`} activeClassName="active-nav-link" >
            Lists
          </NavLink>
          {/* links to Tweets and Lists here */}
        </section>

        <div className="tweets">
          <Route path="/users/:userId" exact render={() => this.renderTweets()}/>
          <Route path="/users/:userId/lists" render={() => this.renderLists()}/>
        </div>
      </div>
    );
  }
}

const mapStateToProps = (state, ownProps) => {
  const user = state.entities.users[ownProps.match.params.userId];
  return {
    user,
    tweets: selectTweets(state, user),
    lists: selectLists(state, user),
  };
};

const mapDispatchToProps = (dispatch) => ({
  requestSingleUser: (userId) => dispatch(requestSingleUser(userId)),
});

export default connect(mapStateToProps, mapDispatchToProps)(UserShow);
