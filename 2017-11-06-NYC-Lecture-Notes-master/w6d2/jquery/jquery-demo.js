window.$ = $;

const goodAlert = e => alert(`hello from list item ${e.target.innerHTML}`);

$(function() {
  $('li').on('click', goodAlert);
});
