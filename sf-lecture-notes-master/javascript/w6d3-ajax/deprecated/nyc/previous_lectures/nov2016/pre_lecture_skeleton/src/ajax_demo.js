function fetchUsers(success, error)  {
  const lastId = Math.round(Math.random() * 23000000);

  $.ajax({
    url: `https://api.github.com/users?since=${lastId}`,
    method: 'GET',
    success,
    error
  });
}

function success(data, status, jqXHR) {
  debugger
  // data.forEach(function (datum) {
  //   $a = $('<a>');
  //   $a.attr('href', datum.html_url);
  //   $a.append(datum.login);
  //
  //   $('ul').append($('<li>').append($a));
  // });
}

function error(jqXHR, status, error) {
  debugger
  // $figure = $('figure');
  // $figure.addClass('alert');
  // $figure.append(error);
  // setTimeout(() => $figure.removeClass('alert'), 2000);
}

// fetchUsers(success, error);

///////////////
// PROMISES! //
///////////////

// function fetchUsersPromise() {
//   const lastId = Math.round(Math.random() * 23000000);
//
//   return $.ajax({
//     url: `https://api.github.com/users?since=${lastId}`,
//     method: 'GET'
//   });
// }
//
// fetchUsersPromise().then(success, error)

///////////////////////
// TWEET THE THINGS! //
///////////////////////

// function fetchTweets() {
//   return $.ajax({
//     url: 'http://localhost:3000/tweets.json',
//     method: 'GET'
//   });
// }
//
// function tweetSuccess(tweets, status, jqXHR) {
//   $('h1').html('Tweets');
//
//   tweets.forEach(function (tweet) {
//     $a = $('<a>');
//     $a.attr('href', `http://localhost:3000/tweets/${tweet.id}`);
//     $a.append(tweet.body);
//
//     $('ul').append($('<li>').append($a));
//   });
// }
//
// fetchTweets().then(tweetSuccess, error);
