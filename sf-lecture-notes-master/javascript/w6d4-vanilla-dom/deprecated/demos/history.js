history.pushState({ key: 'this_is_just_an_identifier'}, "page title", "#rage");

window.addEventListener('popstate', function(event) {
  alert('Are you sure you want to leave?');
});
