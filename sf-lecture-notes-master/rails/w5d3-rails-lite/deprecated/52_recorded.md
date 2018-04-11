# Week 5 Day 2

#### WEBrick

Let's make a server
```ruby
require 'byebug'
require 'webrick'
require 'erb'
require 'json'

server = WEBrick::HTTPServer.new(Port: 3000)

template = "I like to wear green with <%= name %>"

# mount a proc
server.mount_proc('/') do |req, res|
  # the magic happens in here
  name = 'stranger'
  if req.query['name']
    name = req.query['name']
    # let's store the name value in a cookie so we don't have to
    # enter it every time we visit the page
    res.cookies << WEBrick::Cookie.new('GREEN_APP', {username: name}.to_json)
  else
    cookie = req.cookies.find { |c| c.name == "GREEN_APP" }
    if cookie
      data = JSON.parse{ cookie.value }
      name = data['username']
    end
  end

  res.body = ERB.new(template).result(binding)
end

server.mount_proc('/paradise') do |req, res|
  # in order for a redirect to happen, you need to set the status to 302
  # and tell it where it needs to redirect to
  res.status = 302
  res['location'] = 'http://fiddler.io'
end

server.start

trap('INT') { server.shutdown }
```
