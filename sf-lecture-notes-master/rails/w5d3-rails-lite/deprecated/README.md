# Rails lite!!
Rails lite is an awesome project; it's my personal favorite. It's super tricky though, and
can be really mind bending if you're not ready for it. It's possible to throw yourself at
the specs and get them to pass without fully understanding what's going on. Don't do this. 
Ask us for help; ask us to explain core concepts. Understanding this concept puts you head 
and shoulders above other junior developers.

## HTTP basics
HTTP (hypertext transfer protocol) is just a set of rules defining how a client 
and a server can interact. People who make websites agree to use this protocol
to communicate with each other. There are tons of protocols; "one if by land" 
was a type of protocol. HTTP is a simple protocol; it only requires 3 things 
for a request to be valid (a method, a path, and a host).
- request/response
- headers: metadata, they provide the browser with information about the response
- body: the content, this is what the browser will display
- cookies: data to be stored between requests
- requirements for valid request
  - method
  - path
  - host
- brief netcat demo (save the TCP chat for wednesday)
  - `nc google.com 80` (netcat host port)
  - `GET` - method
  - `/` - path
  - `HTTP/1.1` - protocol
  - `host: www.google.com` - host (may work without it, but won't guarantee correct results) 
- show all the components in the chrome dev tools

## Purpose of Rails Lite
We are not building a website. We are building a framework so that
other people can build a website. Your rails lite framework is a tool,
not the finished product.
You are going to build all those base classes that you've
been using the past two weeks.

You receive a request. You then need to build a response. This is all
you need to do; this is all you can do; this is everything that you must
do. Think, what does `render` do, what does `redirect_to` do? Why can
there only be one of these things?

## Rack
Rack is a middleware that simplifies the process of writing frameworks and
webservers in Ruby
Gem: `require 'rack'`
- `::Request` / `::Response`
- demo super simple server (phase 0)

### order
##### Step 1
- make `RackApplication` that sets response by hand

##### Step 2
- use the query string to change the name displayed

##### Step 3
- cookies (2 components: name and value):
  - store a cookie if there's a field in the query string (need JSON gem)
  - show this cookie in the resources
  - if there isn't a query string, look for the name in the cookies (parse json)
  - use that name to display persisted data
- show setting up a redirect
