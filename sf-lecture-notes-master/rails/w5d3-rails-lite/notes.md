## Rails Lite Intro Video
* this project is hard but useful

## HTTP
* HyperText Tranfer Protocol
* examples of protocols
* request header specifies method, path, version
* response specifies version, content type, length, and body

## HTTP Example
* nc example.com 80
* GET / HTTP/1.1
* Host: example.com

## Rails Inside Out
* framework: base functionality and modules for accomplishing a tasks
* provides common modules for specific tasks, no wheel re-invention
* in rails you are provided: router, ActionControllerBase, ActiveRecord::Base
* you write: routes, inherited controllers, inherited models
* so today we are writing the router and ActionControllerBase
* need to write a router that can read a routes file and match paths
* need a way to pass variables to a view template

## Rack
* middleware - in between web server and web application
* webserver gets request and gives to rails, gets response to send back to client
* why so many webservers? different strengths, webrick - no config
* also other ruby web frameworks: padrino, rails, sinatra, camping
* ruby webserver's job is to receive request which is just a string and turn it
  into some sort of useful ruby object
* each webserver's request format is identical because they conform to rack interface
* each response from ruby framework is identical because it also flows through rack

## Rack Demo
* for something to be 'rack compliant' it has to be a ruby object that has a 'call'
  class method
* Rack::Server.start({app: MyAppClass, Port: 3000})
* `env` is argument passed by rack to rack application
* `env` a big hash with all the headers parsed into key val pairs
* can write all kinds of stuff in the body of the rack app, as long as it returns
  a properly formatted thing, which is either the array or res.finish
* see code below for example

```ruby
require 'rack'
require 'json'

class RackApp
  def self.call(env)
    [
      '200',
     {'Content-Type' => 'text/html'},
     ['hey there']
    ]
  end
end

class SimpleApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new
    name = req.params['name']
    res.write("Hello #{name}")
    res.finish
  end
end

class CookieApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new
    food = req.params['food']
    if food
      res.set_cookie(
        '_cookies',
        {
          path: '/',
          value: { food: food }.to_json
        }
      )
    else
      cookie = req.cookies['_cookies']
      cookie_val = JSON.parse(cookie)
      food = cookie_val['food']
    end
    res.write("I love to eat #{food}")
    res.finish
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  if req.path.start_with?("/cage")
    res.status = 302
    res['Location'] = 'http://o.aolcdn.com/hss/storage/midas/627f1d890718ff2c58318a280145a153/203216448/nicholas-cage-con-air.jpg'
  else
    res.write("nothing to see here...")
  end
  res.finish
end

Rack::Server.start({
  app: app,
  Port: 3000
})
```
