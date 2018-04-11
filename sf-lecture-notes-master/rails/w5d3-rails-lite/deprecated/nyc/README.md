[Feb 2016:  Lily](./previous_lectures/february2016.pdf)  
[April 2016: Daniel](./previous_lectures/april2016)  
[Aug 2016:  Leen](./previous_lectures/august2016.rb)  

## Solutions prep

**Expect questions on:**
+

**Point out:**
+ nested FactoryGirl

## Lecture

**1) Rails Lite**
+ Draw picture of laptop (client) and server
+ Emphasize difference between HTTP requests/response cycle and Rails
  + A webserver processes HTTP requests/responses into Ruby
  + We're building the rails bit:
    + Router processes Raw request { path: '/cats', method: 'GET'}
    + Instantiates controller/calls action, CatsController.new.index
+ Clarify word 'server', 3 common uses
  1. Computer in basement
  2.  Your app
  3. Software that that process HTTP requests/responses  
  We're using definition #3 today!

**2) Rack**
+ Middleware. Webservers translate HTTP requests from strings to Ruby hashes. But each server translates HTTP to Ruby in a different way. We use Rack to paper over those differences so we can build a framework that works with many different servers
+ Basic App
  + Rack::Server.start{ app: app }
  + app returns 3-item array, status, headers, body
  + Show rack intro page!
  + 'app must respond to #call' --- let's use a Proc!
+ Show network tab!

**3) Rack::Request and Rack::Response**
+ These wrappers help us build more complicated responses. Rewrite your simple app with these classes.
+ `write` is better than `#body =`. Show docs!
+ `finish` returns an array with status code, headers, and body. Just what Rack::Server needs for the return value of `app.call`
+ Show network tab!

**4) Cookies**
+ We can use `Request#cookies` to read cookies, and `Response#set_cookie` to write cookies! Don't write cookies explicitly in the header with `['Set-Cookie']`
+ Demo syntax where the second argument to `set_cookie` is an options hash. This always trips people up in the instructions (unless the instructions got better!). Show cookies in Chrome, every column in the table (expiration date, path, etc) can be given in the options hash.
+ Show network tab! And the cookies!
