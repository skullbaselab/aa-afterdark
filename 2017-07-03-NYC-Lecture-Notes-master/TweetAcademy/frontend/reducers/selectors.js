import { values } from 'lodash';

export const selectTweets = (state, user) => {
  if (!user) {
    return state.entities.tweets.ord.map(id => state.entities.tweets.index[id]);
  }

  if (!user.tweet_ids) {
    return [];
  }
  return user.tweet_ids.map(id => state.entities.tweets.index[id])
};

export const selectLists = (state, user) => {
  if (!user) {
    return values(state.entities.lists);
  }

  if (!user.list_ids) {
    return [];
  }

  return user.list_ids.map(id => state.entities.lists[id])
};

export const selectUsers = (state, list) => {
  if (!list) {
    return values(state.entities.lists);
  }

  if (!list.user_ids) {
    return [];
  }

  return list.user_ids.map(id => state.entities.users[id])
};
