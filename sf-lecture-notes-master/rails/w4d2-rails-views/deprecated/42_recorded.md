# Week 4 Day 2

```html
<!DOCTYPE html>
<html>
  <head>
  </head>

  <body>
  </body>
</html>
```


```sh
> python -m SimpleHTTPServer 8001
```

You can explicitly specify a layout if you don't want to use the default application layout
```ruby
render :index, layout: :my_other_layout
```

### HTML
- Avoid `table`, `tr`, `td`, `th`. Except for maybe email viewers.
- Try to use
  - `html`
  - `head`
  - `title`
  - `body`
  - `div`
  - `span`
  - `p`
  - `a`
  - `section`
  - `asside`
  - `header`
  - `footer`
  - `main`
  - `button`
  - `form`

Bootstrap has an awesome grid system, so use that instead of tables.


```html
<% 10.times do |num_div| %>
  <div class=<%= div_num %>>Hi I'm in div <%= div_num %></div>
<% end %>
```

#### What's available to views
- instance variables in the controller
- methods defined in helper modules

Example:
```html
<h1> Humans </h1>

<ol>
  <% @humans.each do |human| %>
    <li><%= human.name %></li>
    <%= link_to human.name, human_url(human) %>
    <%= button_to "Delete", human_url(human), method: :delete %>
  <% end %>
</ol>
```

- `button_to` actually makes an entire form

### Forms
- Forms can only `get` and `post`. The default is `get`. You'll have to specify the method in the `form` tag.

```html
<h1> Create Human </h1>

<form action="<%= humans_url %>" method="post">
  <input type="text" name="human[name]">
  <input type="submit" value="Create Human">
</form>
```

```html
<!-- show.html.erb -->

<h1> <%= @human.name %> </h1>

<%= link_to "Edit", edit_human_url(@human) %>
<%= link_to "All Humans", humans_url %>
```

### Flash
- use `flash` with `redirect_to`
- use `flash.now` with `render`

```html
<h1> Edit Human </h1>

<% flash[:errors] && flash[:errors].each do |error| %>
  <li><%= error %></li>
<% end %>

<form action="<%= human_url(@human) %>" method="post">
  <input type="hidden" name="_method" value="patch">

  <label for="human-name">Name:</label>
  <input id="human-name" type="text" name="human[name]" value="<%= @human.name %>">

  <label>Name:
    <input type="text" name="human[name]" value="<%= @human.name %>">
  </label>

  <input type="submit" value="Save Human">
</form>
```

### View Partials
- Break up long views into smaller pieces
- Partials start with an underscore (for example `_form.html.erb`)

```html
<!-- _form.html.erb -->

<% title = human.persisted? ? "Edit" : "Create" %>
<% method = provider.persisted? ? "PATCH" : "POST" %>
<% action = human.persisted? ? human_url(human) : humans_url %>

<h1> <%= title %> Human </h1>

<% flash[:errors] && flash[:errors].each do |error| %>
<li><%= error %></li>
<% end %>

<form action="<%= action %>" method="post">
<input type="hidden" name="_method" value="<%= method %>">

<label for="human-name">Name:</label>
<input id="human-name" type="text" name="human[name]" value="<%= @human.name %>">

<label>Name:
<input type="text" name="human[name]" value="<%= @human.name %>">
</label>

<input type="submit" value="<%= title %> Human">
</form>
```
##### How to include the partial
- pass it local variable

```html
<%= render partial: "form", locals: { human: @human } %>

<!-- shorter way to write the above -->
<%= render "form", human: @human %>
```
