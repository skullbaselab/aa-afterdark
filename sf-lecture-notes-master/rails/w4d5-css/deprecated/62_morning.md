# Content

## CSS Selectors
* css is just attributes on selectors
* show how to use chrome to debug css
* div inside div

## CSS Display Attribute
* span vs div (span inline, div block-line(line break before and after))
* types
    * inline
    * block
    * inline-block
    * none

## jQuery Fundamentals
* `$(document).ready or $(fn(){});`
* `$('div')` returns an array
* `$('<div>')` makes an element
* append, prepend, after, before
* each, iteration unwraps element

```javascript
$('.post').each(function(index, element) {
  $(element).prepend('<h1>This is post #' + index + '</h1>');
});
```

* attr will set any attribute
* bind with `on`, unbind with `off`
* how to delegate if li's are added later

```javascript
$(function () {
  $("ul.cats").on("click", "li.cat", function () {
    // handle a cat click
  });
});
```

## data-* attributes

# Projects
Dont mix ui with model, dont listen for ui events in snake.js, only snake_ui.js

## Gotchas

* Bootstrapping: Hitting an error "unexpected token 'o'" when calling JSON.parse.

```var data = JSON.parse($("#bootstrapped_emails_json").html());```
The cause was that JSON.parse expects a string, and the #boostrapped_emails_json contained an array of rails objects.
Maybe the problem was my #bootstrapped_emails_json, which looks like this:
tags: [<%= Tag.all.to_json.html_safe %>]
I converted the whole thing to a string, but then the "id" attribute also needed to be "1" rather than just 1, so I used a regex to fix that.
Then, I converted the whole string to JSON with JSON.parse.

