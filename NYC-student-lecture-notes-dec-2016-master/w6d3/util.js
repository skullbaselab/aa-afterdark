const jackBauerGifs = () => {
  return $.ajax({
    url: 'http://api.giphy.com/v1/gifs/search?q=24+jack+bauer&api_key=dc6zaTOxFJmzC&rating=pg',
    type: 'GET'
  });
};

const searchGifs = (terms)  => {
  return $.ajax({
    url: `http://api.giphy.com/v1/gifs/search?api_key=dc6zaTOxFJmzC&q=${ terms.join('+') }&rating=pg`,
    type: 'GET'
  });
};

// fat-arrow functions have implicit return if you omit curly braces
const trendingGifs = () => $.ajax({
  url: 'http://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC&rating=pg',
  type: 'GET'
});

const userGifs = username => $.ajax({
  url: `http://api.giphy.com/v1/gifs/search?username=${username}&api_key=dc6zaTOxFJmzC&rating=pg`,
  type: 'GET'
});


module.exports = { jackBauerGifs, searchGifs, trendingGifs, userGifs };
