/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _gif_api_util = __webpack_require__(1);

var GifApiUtil = _interopRequireWildcard(_gif_api_util);

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

var appendGif = function appendGif(newGif) {
  $(".gif-display").empty();
  $(".gif-display").data("url", newGif);
  $(".gif-display").append($("<img class=\"gif\" src=" + newGif + " />"));
};

var setEventHandlers = function setEventHandlers() {
  $(".clear").on("click", function () {
    $(".gif-display").empty();
  });

  // preventDefault prevents requests being made to the server
  $("#new-gif-form").on("submit", function (e) {
    e.preventDefault();
    fetchNewGif();
  });

  $("#save-gif-form").on("submit", function (e) {
    e.preventDefault();
    saveGif();
  });

  $("#old-gif-form").on("submit", function (e) {
    e.preventDefault();
    fetchSavedGif();
  });
};

$(function () {
  setEventHandlers();
});

// ------------- GIF ACTIONS - fetchNew, save, and fetchSaved ---------------

var fetchNewGif = function fetchNewGif() {
  var $input = $("#new-gif-query");
  var queryString = $input.val();
  $input.val("");

  // Initiate AJAX call to GIPHY API, take response and put on the DOM
  // AJAX requests are asynch, so code after the request would get run before the request gets completed
  // solution: promises!
  // can only chain .then on promises, prommises
  GifApiUtil.newGifAJAX(queryString).then(function (response) {
    var url = response.data.image_url;
    // have access to appendGif bc its being closed over
    appendGif(url);
  });
};

var saveGif = function saveGif(e) {
  var $input = $("#save-gif-title");
  var title = $input.val();
  $input.val("");

  var gif = {
    // below is a shortcut for title: title
    title: title,
    url: $(".gif-display").data("url")
  };

  // Initiate AJAX request to Rails backend, give a message if successful
  // give an error if request was unsuccessful
  // promises accept two arguments: a success callback, and a non-success callback (stuff to do if unsuccessful request)
  GifApiUtil.saveGifAJAX(gif).then(function () {
    $('.messages').empty();
    $('.messages').append('Gif Saved!');
  }, function (response) {
    $('.messages').empty();
    $('.messages').append(response.responseJSON[0]);
  });
};

var fetchSavedGif = function fetchSavedGif() {
  var $input = $("#old-gif-query");
  var title = $input.val();
  $input.val("");

  // Initate AJAX request to Rails backend, add gif to the DOM if successful
  // show errors if request was unsuccessful
  var success = function success(response) {
    appendGif(response.url);
  };
  var error = function error(response) {
    $('.messages').empty();
    $('.messages').append(response.responseJSON[0]);
  };
  // catch catches any errors not caught by any of the previous promises 
  GifApiUtil.fetchSavedGifAJAX(title).then(success).catch(error);
};

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


Object.defineProperty(exports, "__esModule", {
  value: true
});
var newGifAJAX = exports.newGifAJAX = function newGifAJAX(queryString) {
  // $.ajax returns a promise
  return $.ajax({
    method: "GET",
    url: "https://api.giphy.com/v1/gifs/random?tag=" + queryString + "&api_key=9IfxO6R6fpEZMAdqdw66QUgQdPejVIAW&rating=G"
  });
};

var saveGifAJAX = exports.saveGifAJAX = function saveGifAJAX(gif) {
  var key = 'gif';
  return $.ajax({
    method: "POST",
    url: "/gifs",
    // want key of gif to structure params as our controller expects them
    // js object keys are automatically converted to strings unless you interpolate in brackets to specify you want the value of that variable
    // data: {[key]: gif}
    // below is an ES6 shortcut for above. works bc variable name is same as key name
    data: { gif: gif }
  });
};

var fetchSavedGifAJAX = exports.fetchSavedGifAJAX = function fetchSavedGifAJAX(title) {
  return $.ajax({
    method: "GET",
    url: "/gifs/" + title
    // can also specify success and error callbacks here, but we abstracted them to when we make the request
    // success: successCallback,
    // error: errorCallback
  });
};

/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map