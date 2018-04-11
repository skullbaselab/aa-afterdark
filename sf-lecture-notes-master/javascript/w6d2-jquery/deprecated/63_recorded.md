# Week 6 Day 3


### jQuery

- `document` is an object that allows JS to do cool stuff
- smooths over differences in browsers
- [YouMightNotNeedjQuery.com](youmightnotneedjquery.com)

```js
// gives us an array of jQuery objects that match the below CSS selector
var $easel = $('#easel');
```

```js
_colors = ['salmon', 'cornflowerblue', 'yellow', 'yellowgreen', 'navajowhite', 'mistyrose', 'green', 'fuchsia', ]

function Painter($easel) {
  this.$easel = $easel;
  this.buildCanvas();
  this.registerEvents();
}

// $ is a jQuery namespace
$.extend(Painter.prototype, {
  buildCanvas: function () {
    // .html inserts into the page whatever you pass in
    // this.$easel.html("lol");
    _.times(20, this.addRow.bind(this));
  },

  regesterEvents: function () {
    this.$easel.on('click', '.square', this.paintSquare.bind(this));
    this.$button.submit('submit', this.addRowClicked.bind(this));
  },

  addRowClicked: function () {
    event.preventDefault();
    this.addRow();
    this.render();
  },

  addRow: function () {
    var $easel = $('#easel');
    var bigString = "";
    _.times(20, function () {
      bigString += "<div class='square'></div>";
    });
    this.$easel.append(bigString);
  },

  paintSquare: function (myEvent) {
    var $square = $(myEvent.currentTarget);
    var color = _.sample(_color);
    $square.css('background-color', color);
    $square.attr('data-color', color)
  }
});

$(function () {
  // put code in here to be executed on document ready
  var $easel = $('#easel');
  p = new Painter($easel);
})

```

```css
#easel {
  width: 500px;
  margin: 0 auto;
}

.square {
  outline: 1px solid gray;
  width: 25px;
  height: 25px;
  float: left;
  transition: outline 0.5s, background-color 0.5s
}

.square:hover { outline: 1px solid red; }
```
