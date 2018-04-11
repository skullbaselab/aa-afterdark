/*
Goals:
1. mark individual ToDos complete/incomplete

2. add new todos via the form

3. mark all ToDos complete

*/

// The Four Uses of $
// 1. Raw HTML Dom Element => Find Html elements that match the tag type given
// 2. CSS Selector => Find Html elements that match the class given
// 3. Create Html Element => Create an Html element matching the tag passed in
// 4. Document Ready Callback => Pass a callback to execute once the document is ready

function addToDo (e) {

  e.preventDefault();
  const $form = $(e.currentTarget);
  const toDoText = $form.find('input[type=text]').val();

  const $newToDo = $('<li>', {
    text: toDoText,
    'class': 'incomplete'
  });

  // You can pass an options hash like the above
  // Or chain on jquery methods like below:
    // .text(toDoText)
    // .addClass('incomplete');

  $('.todo-list').append($newToDo);

}

function toggleToDo (eventObject) {

  eventObject.stopPropagation();
  const $li = $(eventObject.target);
  $li.toggleClass('complete');
  $li.toggleClass('incomplete');
  console.log('Toggling...');
}

function completeAll () {

}

// jquery's Explicit Iteration
// $('li').each( (idx, el) => {
//   $(el).on('click', toggleToDo.bind(null, el));
// });

// Instead of loading our Javascript at the bottom of our Html,
// Lets use jquery's document ready to load our Javascript
// once we hear that the html has successfully be loaded

// $('document').ready( () => {
$(() => {

  // Leveraging jquery's Implicit Iteration
  // Current Target is the thing we've registered the
  // listener on.
  // $('li').on('click', toggleToDo);

  // Applying our event handler to the desired target's parent
  // leveraging event bubbling/propagation
  // Current Target is the ul when this callback is executed
  $('.todo-list').on('click', 'li', toggleToDo);

  // $('ul').on('click', (e) => {
  //   // debugger;
  //   console.log('Was alerting...');
  // });

  // Current Target is the form, as that is what the
  // listener is registered on
  $('form').on('submit', addToDo);
});









// bottom
