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
  return $.ajax({
    url: '/facts',
    method: 'GET',
    dataType: 'JSON' //data type we want back in body of response
  }); //jquery ajax function returns a 'Promise' object

  //this is just to show chaining then's, not good practice
  // fetchFact(1).then((fact) => {
  //   appendFact(fact);
  // }).then(() => {
  //   fetchFact(2).then((fact) => appendFact(fact));
  // });
}

function fetchGif() {
  const offset = Math.floor(Math.random() * 250);
  return $.ajax({
    method: 'GET',
    url: 'http://api.giphy.com/v1/gifs/search?q=cat&rating=g&api_key=dc6zaTOxFJmzC&limit=1&offset=' + offset
  });
}

function fetchFact(id) {
  return $.ajax({
    method: 'GET',
    url: `/facts/${id}`,
    dataType: 'JSON'
  });
}

function postFact(form) {
  $.ajax({
    method: 'POST',
    url: '/facts',
    dataType: 'JSON',
    data: $(form).serialize(),
    success: (fact) => appendFact(fact)
  });
}

//actually putting the facts on the page
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
  //registering event listeners
  $('#fetch-facts').on('submit', (e) => {
    e.preventDefault(); //dont forget this!
    fetchFacts().then((facts) => {
      //this callback gets invoked after the ajax request completes with success status
      appendFacts(facts);
    }, (err) => console.log(err));
  });

  $('#fetch-gif').on('submit', (e) => {
    e.preventDefault();
    fetchGif().then((r) => {
      appendGif(r.data[0].images.original.url);
    });
  });

  $('#fetch-fact').on('submit', (e) => {
    e.preventDefault();
    const id = $(e.currentTarget).find('input[name="id"]').val();
    fetchFact(id).then((fact) => appendFact(fact), (error) => console.log(error));
  });

  $('#post-fact').on('submit', (e) => {
    e.preventDefault();
    // const body = $(e.currentTarget).find('input[name="body"]').val();
    postFact(e.currentTarget);
  });
});
