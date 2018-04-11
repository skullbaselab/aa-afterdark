# AJAX

## What is AJAX?

It stands for:
  - Asynchronous
  - JavaScript
  - And
  - XML (but really JSON)

## What does it do?

### In essence:

It makes requests and receives responses on the client side. It
effectively connects the front-end and back-end worlds without the need
for a hard refresh. It doesn't actually "make the Internet faster", but
  it reduces perceived waiting time pretty dramatically and makes the
  entire idea of a "one page app" viable.

### In more detail:

AJAX is just JavaScript. As such, it doesn't give us anything we
couldn't do with the objects and methods built into the standard browser
JS environment; it's just a lot harder that way. Even though we're all
about making students do things the hard way, AJAX is simply too useful
to pass up. Without it, we would have to instantiate an XMLHttpRequest
object, set all the options by hand, and then send it. AJAX wraps all of
this in a nice convenient package.

```js
// the xhr way
var xhr = new XMLHTTPRequest();
xhr.open('GET', 'http://localhost:3000');
xhr.onreadystatechange = function () {
  console.log(xhr.responseText);
}
xhr.send();

// the ajax way
$.ajax({
  url: 'http://localhost:3000',
  success: function(response) {
    console.log(response);
  }
});
```

## How do we use it?

If all you want is a simple "delete" button, it's pretty easy.

```js
$("button.delete").on("click", function (event) {
  var $target = $(event.currentTarget);
  var commentId = $target.data("comment-id");
  $.ajax({
    url: "http://localhost:3000/comments/" + commentId,
    type: "delete",
    success: function (response) {
      $target.parent().remove();
    }
  });
});
```

If you want to do something more sophisticated (like post form data),
you may need to add to your toolbox (serializeJSON).

### But wait, what about the form auth token?

Rails will handle that for us! Just don't delete the CSRF meta tag.

### Options

- url: where to make the request. Default is the page we're currently
  on.
- type: basically, the HTTP method (get, post, delete); default is GET.
- dataType: what format we expect the server response to be. The default
  is usually good enough, and we'll typically traffic in "json".
- data: an object that gets converted to a query string; this will come
  through in the params.
- success/error: callbacks to be run based on the status code of the
  response. Syntax:
  - success: function (data, textStatus, jqXHR)
  - error: function (jqXHR, textStatus, errorThrown)

# Underscore Templates

+  `_.template();`
+ Similar to ERB: we write HTML with some JS in special tags (the same <% %>
  and <%= %>), underscore produces a template that can be evaluated by
  executing the JS code, then we produce the final HTML by evaluating the
  template
+ When mixing with ERB (as today), we need to be careful; since both use the
  same tags to flag a chunk of code, we must provide a way to tell ERB to pass
  over the underscore templates. Solution: escape Underscore tags with a second
  %: ERB will not try to run the contents as code (which is good) but will
  strip the escaping %, leaving a valid tag
+ Today, we will put our Underscore templates in script tags where we can grab
  the contents with jQuery

## JS + Rails
1. This is the first day of incorporating js with rails. Go over where
to put javascript code: javascript include tag, application.js,
requiring files, vendor/assets/javascripts.
2. Talk about how Rails does prefiltering for csrf/authenticity token.
Mention to never delete the csrf meta tags.

## Project - AJAX Twitter

Jeff: hella fools be trippin on the fact that erb can't run on client side.
