import { RECEIVE_ALL_TWEETS } from '../actions/tweet_actions'
import { RECEIVE_CURRENT_USER } from '../actions/user_actions'
import { merge } from 'lodash'

const _defaultState = {}

export default function(oldState = _defaultState, action) {
  switch (action.type) {
    case RECEIVE_ALL_TWEETS:
      return merge({}, oldState, action.users)
    case RECEIVE_CURRENT_USER:
      return merge({}, oldState, { [action.user.id]: action.user })
    default:
      return oldState
  }
}
