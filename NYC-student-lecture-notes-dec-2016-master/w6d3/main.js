const util = require('./util.js');

const appendGifs = gifs => {
  gifs = gifs.data; // array of gifs stored in gifs.data (which we got back from the request)
  $gifList = $('.gif-list');

  $gifList.empty();

  $gifListItems = gifs.map(gif =>
    $(`<li><img src="${gif.images.original.url}" /><li>`)
  );

  $gifList.append($gifListItems);
};

$( 'document' ).ready( function() { // equivalent to our DOMContentLoaded callback

  /* SO IT BEGINS */
  $('.bauer-button').on('click', () => {
    util.jackBauerGifs().then(appendGifs).catch(console.log);
    // ^^ ajax from util.js
  });

  $('.search').on('submit', e => {
    e.preventDefault(); // prevent form submission
    const $searchForm = $(e.currentTarget);
    const query = $searchForm.children('input')[0].value;

    const results = util.searchGifs(query.split(' '));
    results.then(appendGifs).catch(console.log);
  });

  $('.trending-button').on('click', () => {
    util.trendingGifs().then(appendGifs).catch(console.log);
  });

  $('.top-user-button').on('click', () => {
    util.trendingGifs()
      .then(gifs => util.userGifs(gifs.data[0].username))
      .then(appendGifs);
  });
});
