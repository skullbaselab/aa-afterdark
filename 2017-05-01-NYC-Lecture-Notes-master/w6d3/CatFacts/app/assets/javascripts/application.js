// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// ajax takes an object with keys, some of which are:
// (order doesn't matter in an object)
// URL: the url to make the request to,
// METHOD: HTTP verb to use (GET, POST, etc.)
// DATATYPE: the format of the response we want
// SUCCESS: (200 range) callback to run on success
// ERROR: callback to be run on unsuccessful return


function fetchFacts() {
  $.ajax({
    url: '/facts',
    method: 'GET',
    dataType: 'JSON',
    success: (facts) => appendFacts(facts),
    error: (err) => console.log(err)
  });
}

function fetchGif() {
  const offset = Math.floor(Math.random() * 250);
  $.ajax({
    method: 'GET',
    url: 'http://api.giphy.com/v1/gifs/search?q=cat&rating=g&api_key=dc6zaTOxFJmzC&limit=1&offset=' + offset,
    success: (r) => appendGif(r.data[0].images.original.url)
  });
}

function fetchFact(id) {
  return $.ajax({
    method: 'GET',
    url: `/facts/${id}`,
    dataType: 'JSON'
  });
}

// making use of the promise that is returned from an AJAX call:
// fetchFact(5).then(successCallback, rejectCallback);


// function reject(err) {
//   console.log(err);
// }
//
// fetchFact(5)
// .then(appendFact, reject)
// .then(() => fetchFact(6))
// .then((fact) => appendFact(fact), reject);



// success: (fact) => appendFact(fact),
// error: (err) => console.log(err)


// keys in a javascript object are NOT considered
// variables, unless given square brackets []

// object with no key { body } is a shorthand for
// { body: body } - a key of this name pointing to the
// variable of this same name.

function postFact(body) {
  $.ajax({
    method: 'POST',
    url: '/facts',
    dataType: 'JSON',
    data: { fact: { body }},
    success: (fact) => appendFact(fact),
    error: (err) => console.log(err)
  });
}

function appendFacts(facts) {
  const $facts = $('#facts > ul');

  facts.forEach((fact) => appendFact(fact, $facts));
}

function appendFact(fact, $facts) {
  if(typeof $facts === 'undefined') $facts = $('#facts > ul');

  $facts.prepend(
    `<li>${fact.id}. ${fact.body}</li>`
  );
}

function appendGif(url) {
  $('#gifs > ul').prepend(
    '<li><img src=' + url + '></img></li>'
  );
}

$(document).ready(() => {
  $('#fetch-facts').on('submit', (e) => {
    e.preventDefault();
    fetchFacts();
  });

  $('#fetch-gif').on('submit', (e) => {
    e.preventDefault();
    fetchGif();
  });

  $('#fetch-fact').on('submit', (e) => {
    e.preventDefault();
    const id = $(e.currentTarget).find('input[name="id"]').val();
    fetchFact(id).then((fact) => appendFact(fact));
  });

  $('#post-fact').on('submit', (e) => {
    e.preventDefault();
    const body = $(e.currentTarget).find('input[name="body"]').val();
    postFact(body);
  });
});

// const prom = new Promise( (fulfill, reject) => {
//   setTimeout( () => {
//     const rando = Math.random() * 10;
//     return rando > 5 ? fulfill() : reject();
//   }, 500);
// });
//
// function success() {
//   console.log('PROMISE SUCCEEDED');
// }
//
// function error() {
//   console.log('PROMISE FAILED WOMP WOMP');
// }
//
// prom.then(success, error);
