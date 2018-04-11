$(document).ready(() => {
  addAClass();
  everyOther();
  invokeHandlers();
  createASquare();
});

// alternatively:
// $(() => {
//   addAClass();
//   everyOther();
//   invokeHandlers();
//   createASquare();
// });

function addAClass() {
  $('li').addClass('lol');
}

function addASquare() {
  const li = $('<li>');
  li.addClass('killa');
  $('ul').append(li);
}

function addOddData() {
  $('li').each((idx) => {
    if (idx % 2 !== 0) {
      $($('li')[idx]).data('odd', 'true');
    }
  });
}

function addOddClass() {
  $('li').each((idx, element) => {
    if ( $(element).data('odd') === 'true' ) {
      $(element).addClass('deception');
    }
  });
}

function everyOther() {
  addOddData();
  addOddClass();
}

// This has the same functionality of .ulHandler(), but is more expensive.  It
// is placed on every li.
// function liHandler() {
//   $('li').on('click', (e) => {
//     // debugger
//     $(e.target).toggleClass('deception');
//   });
// }

function ulHandler() {
  $('ul').on('click', 'li', (e) => {
    $(e.target).toggleClass('deception');
  });
}

function invokeHandlers() {
  // liHandler();
  ulHandler();
}

function createASquare() {
  $('body').on('keypress', (e) =>{
    if (e.key === 'n') {
      addASquare();
    }
  });
}
