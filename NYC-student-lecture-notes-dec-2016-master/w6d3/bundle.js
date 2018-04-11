/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const util = __webpack_require__(1);

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


/***/ },
/* 1 */
/***/ function(module, exports) {

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


/***/ }
/******/ ]);