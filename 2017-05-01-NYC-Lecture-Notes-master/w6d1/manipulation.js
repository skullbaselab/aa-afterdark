// TASKS
// 1) RETRIEVE SOME ELEMENTS FROM THE PAGE
// 2) PUT OUR SCRIPT TAG IN ITS PROPER PLACE
// 3) PUT SOME ELEMENTS ON THE PAGE
// 4) CHANGE HOW SOME ELEMENTS LOOK
// 5) PUT HANDLERS ON SOME ELEMENTS

$('.my-form').on('submit', function(e) {
  e.preventDefault();
  const $form = $(e.currentTarget);
  const newLiText = $form.find("input[type=text]").val();
  const $newLi = $("<li>");
  $newLi.text(newLiText);
  $form.siblings().append($newLi);
});

// by passing a callback to the jquery $, we are setting up a function to
// run after the full DOM and all dependencies are loaded

$( function () {
  const submitCallback = function(e) {
    e.preventDefault();
    const $form = $(e.currentTarget);
    const newLiText = $form.find("input[type=text]").val();
    const $newLi = $("<li>");
    $newLi.text(newLiText);
    $('ul').append($newLi);
  };

  $('.my-form').on('submit', submitCallback);

  // setTimeout(function () {
  //   $('.my-form').off('submit', submitCallback);
  // }, 8000);

  $('ul').on('click', 'li', (e) => {
    e.stopPropagation();
    $(e.currentTarget).toggleClass('dark-theme');
  });
  // stopPropagation prevents event listeners on parent objects from triggering as well

  $('ul').on('click', (e) => {
    alert("Alerts are really dumb and you should never use them");
  });
} );
