$(function() {
  $('.big-box')
    .draggable({
      drag: function () {
        console.log("dragging");
        console.log($(this).position());
      },
      stop: function () {
        console.log("derp it like it's hot");
      }
    })
    .droppable({
      accept: '.small-box',
      drop: function (event) {
        $(event.toElement)
          .appendTo($(this))
          .draggable("disable")
          .css({ left:"0px", top:"0px" });
      }
    });

  $('.small-box')
    .draggable({
      start: function () {
        console.log("put me in the big box!");
      }
    })
    .droppable({
      accept: '.tiny-circle',
      drop: function () {
        $(event.toElement)
          .appendTo($(this))
          .draggable("disable")
          .css({ left:"0px", top:"0px" });

      }
    })
// draggable demo
  $('.bubble').draggable({
    drag: function () {
      console.log("dragging");
      console.log($(this).position());
    },

    stop: function () {
      console.log("hammertime");
    }

  });
// droppable demo
  $('.tiny-circle').draggable({
  })
  $('.basket').droppable({
    accept: ".tiny-circle",
    drop: function (event) {
      console.log("derp it like it's hot");
      console.log(event.toElement);
      $(event.toElement).draggable("disable");
      $(event.toElement).addClass("in-basket");
    }
  });

// sortable demo
  $('.sortable').sortable({
  
    stop: function () {
      console.log("maybe make an ajax request here");
    }
  });



})
