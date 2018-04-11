/* global $ */

// Event Handler
const makeRed = (e) => {
	e.preventDefault();
	$(e.currentTarget).css('background', 'red');
};

// Binding of Event Listener
$(() => {
	$('article').on('click', makeRed);
});


