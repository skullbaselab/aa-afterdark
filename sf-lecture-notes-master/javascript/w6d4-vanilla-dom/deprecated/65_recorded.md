# Week 6 Day 5


#### Ajax
- AJAX stands for Asynchronous Javascript And Xml
- purpose: make the internet faster
- take input out of the form with js instead of html

```html
<script type'"text/javascript" charset="utf-8">
  var $form = $('form');
  $form.on('submit', function (event) {
    event.preventDefault();
    var message = $form.serializeJSON();
    $.ajax({
      url: "/messages",
      method: "POST",
      data: message,
      dataType: "json",
      success: function (response) {
        $('#message-list').append("<li>" + response.author + ": " + response.text + "</li>");
        $("loader").remove();
      }
    });
    $('#message-list').append("<div class="loader">Loading...</div>")
  });

  </script>
```

**NB:** 500 error => server error, i.e. look at the server logs!
