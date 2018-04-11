# Debugging Rails Apps

### Are you using these awesome debugging tools?

If it's not already there, add the following to your Gemfile:

```rb
group :development, :test do
  gem 'byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
end
```

Then run `bundle install` and restart your server.

### Do you need to restart the server?

If you've made any changes to your `Gemfile` or anything in the `config`
or `db` directories, the answer is yes. Restart your server and attempt
to reproduce the bug.

### Have you read the error message?

This may seem like a no-brainer, but sometimes it gets forgotten under
pressure.

If you're running RSpec, look at the test failure output; you'll
get the last few lines of the stack trace, starting with the line where
the error was raised. Start looking for the bug there.

If you're running your app in the browser, make sure to read the server
logs. Perhaps counter-intuitively, the most relevant information is
usually at the start of the error output, so you may have to scroll up.

### Have you tried an interactive debugger?

`byebug` can still be useful (especially if you're running RSpec tests),
but `better_errors` and `binding_of_caller` blow it out of the water.
Prefer to use the two of them in combination, whenever possible. If
you're using your app in the browser and hit an error, you should enter
the debugger console immediately. It gives you a console where you can
play around with any variables in scope, and there's even an interactive
call stack; you can click on this to go up/down and try to trace the bug
to its root.

If for some reason you **know** you're hitting an error but can't get
the console to show up, try navigating to
`http://localhost:3000/__better_errors`. You normally won't have to do
this, but it can be very useful once we start writing asynchronous code
(i.e., JavaScript).

### Did you read the RSpec stack trace?

RSpec generates robust error output when a test fails. Make sure you
read this carefully and look at any lines of your code that appear in
the output.

### Did you `save_and_open_page`?

This can be very helpful for figuring out what content is on the page
when RSpec runs its expectations. **NB**: Form inputs don't get saved.
Even if Capybara has executed `fill_in` commands, all of the inputs will
be cleared; don't let this trip you up. Consider
`save_and_open_screenshot` as an alternative.

### Other tips and tricks

#### Refresh the page when modifying templates

Especially if you hit an error and navigate back to the page; this
doesn't actually reload, and uses a cached (now stale) version of the
page.

#### Use the Chrome Dev Tools

Sometimes your application will hit routes that you swear it shouldn't.
Often this happens because you've forgotten to string-interpolate
somewhere, or because you've forgotten to wrap some HTML attribute in
quotes. Right-click (or CTRL-click) and "Inspect Element" to see exactly
what's going on in your HTML.

If you get a bad value stuck in your `flash` (for instance, a `String`
when an `Array` is expected), the easiest solution is simply to erase
your cookie.

1. Open Chrome Dev Tools (CMD+OPTION+I)
2. Click the "Resources" tab
3. Expand "Cookies"
4. Right click and delete your app's cookie.

Alternatively, consider testing in an incognito window.
