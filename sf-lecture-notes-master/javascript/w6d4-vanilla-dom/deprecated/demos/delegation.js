/* global $ */

// without delegation
// $('#MIDDLE .inner').on('mouseover', function (event) {
//   $(this).css('-webkit-filter', 'drop-shadow(6px 8px 9px black)');
// });

// with delegation
$('#MIDDLE').on('mouseover', '.inner', function (event) {
  $(this).css('-webkit-filter', 'drop-shadow(6px 8px 9px black)');
});


$('#MIDDLE').append("<div class='inner'>THIRD INNER DIV</div>");