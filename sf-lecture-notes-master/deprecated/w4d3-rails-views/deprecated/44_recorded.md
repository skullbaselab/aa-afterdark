# Week 4 Day 4

#### Partials

How to render it in views:

```html
/* partial in user sign up */
<%= render "shared/errors", new_user: true, form_action: users_url, user: @user %>

/* partial in user login */
<%= render "shared/errors", new_user: false, form_action: session_url, user: @user %>
```

Write helper methods that can be used inside any view
```ruby
module ApplicationHelper
  def csrf_input
    html = <<-HTML
      <input type="hidden"
             name="authenticity_token"
             value="#{form_authenticity_token}">
    HTML
    html.html_safe
  end

  def avatar_for(user)
    html = <<-HTML
      <img src="#{html_escape(user.avatar_url)}">
    HTML
  end
end
```

- The reason why you use `#{ }` instead of `<%= %>` is because of the order of operations.
- The `form_authenticity_token` doesn't need to be escaped because it gets evaluated and put on the page before a malicious user gets a chance to change it.


#### Debugging
- `gem 'better_errors'` - shows more readable error massages
- `gem 'binding_of_caller'` - gives you a console in the browser. Just like `debugger`, you can drop a `fail` on any line in your controllers and then user the console in chrome to debug your code!
