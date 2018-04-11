# W4D2

+ HTML

anatomy of a page...

+ Views
  + ERB
+ Forms
+ Param Conventions

---

## HTML

+ **use**: html, head, title, body, div, span, p, a, section, aside,
header, footer, main, button, form

+ **avoid**: table, tr, td, th

---

## Views

* templates are HTML + ruby
* instance vairables set in controller are available in view
* double render
* job of view is presentation logic
* how each view fits into application.html.erb with `<%= yield %>`

---

## ERB
* <% vs <%= vs <%#
* never puts
* instance variables values are copied from view
* <%= link_to "cat pics", helper_url %>, you can specify method, but
* only use it for get.
* <%= button_to "delete post", app_url(@app), :method=>:delete %>

---

## HTML Forms
* No form helpers!
```html
<form action="/users" method="post">
  <input type="hidden" name="authenticity_token" value="<%=
form_authenticity_token %>" />
  <input type="submit" value="create cat" />
</form>
```
* HTML forms only use GET and POST, need to send _method to trick rails
* into PUT and DELETE

---

## View Partials
* to break up long views into smaller pieces

```html
<% action_url = (action == :new) ? users_url : user_url(user) %>
<form action="<%= action_url %>" method="post">
  <% if action == :edit %>
    <input type="hidden" name="_method" value="put">
  <% end %>
</form>
```

* render objects `render @cat`



---

### Rails Parameter Conventions
* Demo: Rack::Utils.parse_query "name=fred&phone=012345678"
* Rule 1: Hash

```
<input id="person_name" name="person[name]" type="text" value="Henry"/>
{'person' => {'name' => 'Henry'}}
```

* Rule 2: Array

```
<input name="person[phone_numbers][]" type="text" value="555-123-4567"
/>
<input name="person[phone_numbers][]" type="text" value="555-765-4321"
/>
<input name="person[phone_numbers][]" type="text" value="555-135-2468"
/>
{ "person" => {
    "phone_numbers" => [
      "555-123-4567",
      "555-765-4321",
      "555-135-2468"
    ]
  }
}
```

---

* Rule 2.5: No Arrays of Hashes

```
<input name="persons[0][phone_number]" type="text" value="555-123-4567"
/>
<input name="persons[1][phone_number]" type="text" value="555-765-4321"
/>
<input name="persons[2][phone_number]" type="text" value="555-135-2468"
/>
{ "persons" => {
    "0" => { "phone_number" => "555-123-4567" },
    "1" => { "phone_number" => "555-765-4321" },
    "2" => { "phone_number" => "555-135-2468" }
  }
}
```

---

# Projects
* Cat
* CatRentalRequest
    * prevent overlapping requests
* will have member routes for approve deny
* dependent destroy
* before_save filter

### Hints

* For CatRentalRequest#overlapping_requests, you can use SQL's `BETWEEN`
---

## Gotchas

*  Not being able to debug quickly in rails/read the server log.
*  People sometimes don't realize that validations are running when
*  they're 
calling .save, especially if they're calling .save on a model within
another 
model's method (like .approve).
*  People often get tripped up with "cannot call method on Nil class"
*  errors and not routing to the correct controller.
*  Custom validation: adding to the errors hash to fail a validation
*  instead of returning true/false.

