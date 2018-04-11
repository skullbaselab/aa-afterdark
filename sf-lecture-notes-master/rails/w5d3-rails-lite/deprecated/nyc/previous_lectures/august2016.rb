require 'rack'
require 'byebug'
require 'json'

# What is Server? What Server do?
# Maybe a computer in Oregon (definitely only Oregon)
# Maybe also the web app we're building
# But also the software that processes the HTTP requests and returns a response
# All of these are technically correct, but today we're referring to the last one

######### Intro
# http://rack.github.io/

# app = Proc.new do |env|
    # ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
# end

######### Rack::Request and Rack::Response

# app = Proc.new do |env|
  # req = Rack::Request.new(env)
  # res = Rack::Response.new
  # res['Content-Type'] = 'text/html'
  # res.write('more complex Rack app!') # always use this to edit the body!!
  # # debugger
  # res.finish
# end

######### Cookies

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  messages = req.cookies['messages'] ? JSON.parse(req.cookies['messages']) : []
  if req['message']
    messages << req['message']
    # res['Set-Cookie'] => NO NO NO NO NO NO
    res.set_cookie('messages', {
      value: messages.to_json
    })
  end
  res.write(messages)
  res.finish
end


Rack::Server.start(
  app: app,
  Port: 8080
)
