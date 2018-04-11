require 'rack'
require 'byebug'
# app = Proc.new do |env|
#   debugger
#   [200, { 'Content-Type' => 'text/html' }, ["I'm an app!"]]
# end


# app = Proc.new do |env|
#   [
#     301,
#     {
#       'Location' => 'https://html5zombo.com/',
#       'Content-Type' => 'text/html'
#     },
#     # This line is unnecessary in a redirect
#     ["I'm an app!"]
#   ]
# end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  res['Content-Type'] = 'text/html'
  res.write("I'm an app!")
  # debugger
  # remember to finish your response!
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)


# https://html5zombo.com/
