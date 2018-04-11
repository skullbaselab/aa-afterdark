# Week 6 Day 4

```html
/*index.html*/

<html>
  <head>
    <title>Slideshow</title>
    <script src="https://code.jquery.com/jquery-2.1.1.js"></script>
    <script src="js/slideshow.js"></script>
    <script src="css/slideshow.css"></script>
    <script type="text/javascript" charse="utf-8">
      $(function () {
        $('#slideshow').slideshow(
          imageUrls: [
            // links
          ]
        );
      });
    </script>
  </head>

  <body>
    <a href="javascript:void(0)">Click Me!</a>

    <section id="slideshow">
    </section>
  </body>
</html>
```
- `$.prototype` is the same as `$.fn`

```js
// slideshow.js
$.Slideshow = function (el, options) {
  this.$el = $(el);
  this.$form = this.$el.append('<form><input type="text"></form>')
  this._activeIdx = 0;
  this.$imageContainer = $('<div class="images">');
  this.$el.append($imageContainer);
  this.imageUrls = options.imageUrls || [];
  this.bindEvents();
  this.$imageUrls.forEach(this.addImage.bind(this));
  this.render();
}

$.Slideshow.prototype.render = function () {
  this.$imageContainer.find('img').removeClass('active');
  this.$imageContainer.find('img').eq(this._activeIdx).addClass('active');
};

$.Slideshow.prototype.next = function () {
  this._activeIdx = (this._activeIdx + 1) % this.imageUrls.length;
  this.render();
};

$.Slideshow.prototype.addImage = function (url) {
  var $img = $('<img>').attr('src', url).load(function () {
    $img.addClass('active');
  });
  this.$imageContainer.append($img);
};

$.Slideshow.prototype.bindEvents = function () {
  this.$form.on('submit', function (event) {
    event.preventDefault();
    var url = $(event.currentTarget).find('input').val();
    var url = $(event.currentTarget).find('input').val('');
    this.imageUrls.push(url);
    this._activeIdx = this.imageUrls.length;
    this.addImage(url);
    this.render();
    this.$imageContainer.find('img').removeClass('active');
  }.bind(this));

  this.$imageContainer.on('click', this.next.bind(this));
}

$.fn.slideshow = function () {
  return this.each(function () {
    return new $.Slideshow(this, options);
  });
};
```

```css
/* slideshow.css */

.images {
  visibility: visible;
  float: left;
  display: block;
  position: absolute;
}

.active {
  visibility: visible;
  opacity: 1;
  transition: display 2s ease;
}

img {
  visibility: hidden;
  opacity: 0;
}

img:not(.active) { display: none; }

input {
  width: 500px;
  line-height: 3em;
  font-size: 2em;
}
```
