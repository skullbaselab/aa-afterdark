export const fetchAllTweets = () => (
  $.ajax({
    method: 'GET',
    url: 'api/tweets'
  })
);

export const createTweet = (tweet) => {
  return $.ajax({
    method: 'POST',
    url: 'api/tweets/',
    data: { tweet }
  });
};

export const fetchAllLists = () => (
  $.ajax({
    method: 'GET',
    url: 'api/lists'
  })
);

export const fetchSingleList = (listId) => (
  $.ajax({
    method: 'GET',
    url: `/api/lists/${listId}`
  })
);

export const fetchAllUsers = () => (
  $.ajax({
    method: 'GET',
    url: '/api/users'
  })
);

export const fetchSingleUser = (userId) => (
  $.ajax({
    method: 'GET',
    url: `/api/users/${userId}`
  })
);
