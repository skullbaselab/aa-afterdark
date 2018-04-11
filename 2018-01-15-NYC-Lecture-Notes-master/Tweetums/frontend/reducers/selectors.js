// iterate over all the keys in the tweets slice of state (ie. the tweet ids)
//   and for each id get the tweet with that id, returning them in an array
//   for ease-of-use in our components' render functions
export const selectAllTweets = ({ tweets }) =>
  Object.keys(tweets).map(id => tweets[id])

export const currentUser = ({ session, users }) => users[session.id]

// other selectors here
export const selectorName = (/* probably want to recieve state, maybe other stuff too */) => {
  // body of selector function
}
