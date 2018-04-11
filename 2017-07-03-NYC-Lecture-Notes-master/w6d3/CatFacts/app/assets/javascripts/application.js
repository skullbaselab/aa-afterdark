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

function fetchFacts() {
  // order of the keys in our options object does not matter
  return $.ajax({
    url: '/facts',
    method: 'GET',
    // datatype tells us what type of data we want back. Our controller cares about this
    dataType: 'JSON'
    // what do we do when we get a 200 status code
    // success callbacks accept the server response as an argument
    // success: (facts) => appendFacts(facts),
    // // what do we do when we get a failure
    // error: (err) => console.log(err)
  });
}

function fetchGif() {
  const offset = Math.floor(Math.random() * 250);
  return $.ajax({
    method: 'GET',
    // making a request to the giphy api for a g rated cat gif
    url: 'http://api.giphy.com/v1/gifs/search?q=cat&rating=g&api_key=dc6zaTOxFJmzC&limit=1&offset=' + offset
    // success: (r) => appendGif(r.data[0].images.original.url)
  });
}

function fetchFact(id) {
  return $.ajax({
    url: `/facts/${id}`,
    method: 'GET',
    dataType: 'JSON',
    success: (fact) => {
      // debugger
      appendFact(fact);
    },
    error: (err) => console.log(err)
  });
}

function postFact(body) {
  return $.ajax({
    url: '/facts',
    method: 'POST',
    // data is the body or our request. It should look how we
    // want our params to look
    data: {fact:{body: body}},
    // fancy es6 shortcut
    // data: { fact: { body } }
    dataType: 'JSON',
    success: (fact) => appendFact(fact),
    error: (err) => {
      err.responseJSON.forEach(err => console.log(err));
    }
  });
}

function appendFacts(facts) {
  const $facts = $('#facts > ul');

  facts.forEach((fact) => appendFact(fact));
}

function appendFact(fact) {
  const $facts = $('#facts > ul');

  $facts.append(
    `<li>${fact.id}. ${fact.body}</li>`
  );
}

function appendGif(url) {
  // prepend puts it at the beginning and not the end
  $('#gifs > ul').prepend(
    '<li><img src=' + url + '></img></li>'
  );
}

$(document).ready(() => {
  $('#fetch-facts').on('submit', (e) => {
    // we have preventDefault because the default behavior or submitting a form
    // is to request a brand new page. We don't want that. We just want data
    e.preventDefault();
    fetchFacts().then(function(facts) {
      appendFacts(facts);
    }, (err) => {
      console.log(err);
    });
    // DO NOT DO THIS. THEN IS EXPECTING A CALLBACK AS ARGUMENTS
    // fetchFacts().then(appendFacts());
    // cant just appendFacts over here because the ajax request inside of fetchFacts is asynchronous
    // appendFacts()
  });

  $('#fetch-gif').on('submit', (e) => {
    e.preventDefault();
    fetchGif().then((r) => appendGif(r.data[0].images.original.url));
  });

  $('#fetch-fact').on('submit', (e) => {
    e.preventDefault();
    const id = $(e.currentTarget).find('input[name="id"]').val();
    fetchFact(id);
  });

  $('#post-fact').on('submit', (e) => {
    e.preventDefault();
    const body = $(e.currentTarget).find('input[name="body"]').val();
    postFact(body);
  });
});


const prom = new Promise((resolve, reject) => {
  setTimeout(() => {
    2 + 2  === 5 ? resolve() : reject();
  }, 2000);
});
// then takes two arguments. the first is the success callback, the second is the error callback
prom.then(() => console.log('resolved!'), () => console.log("failure")).then(() => console.log("second thing"));
