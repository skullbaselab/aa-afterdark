/* global $ */

// Event Handler
const makeRed = function (e) {

	e.preventDefault();
	$(this).toggleClass('bg-red');
};

// Binding of Event Listener
$(() => {
	$('.content').on('click', makeRed);
});

