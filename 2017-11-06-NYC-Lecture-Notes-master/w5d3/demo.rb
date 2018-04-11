require 'rack'
require 'byebug'
require 'json'

# app = Proc.new do |env|
#   ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
# end
#
# redirect_app = Proc.new do |env|
#   [
#     '302',
#     {'Content-Type' => 'text/html', 'Location' => 'https://google.com'},
#     ['Go to Google instead']
#   ]
# end
#
# Rack::Server.start(
#   app: redirect_app,
#   Port: 3000
# )


######### Rack::Request and Rack::Response
# use these Rack classes for a convenient API to build more complex responses
# set the Content-Type header and write to the body
# finish the response to send it off

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res['Content-Type'] = 'text/html'
#   res.write('Hello from a Rack Response Object!')
#   res.finish
# end
#
# Rack::Server.start(
#   app: app,
#   Port: 3000
# )


######### Cookies
# get the cookies from the request and parse them from JSON to Ruby
# serialize your data and set it in the cookies of the response
# we'll set a cookie using our params

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  cookie = req.cookies

  if cookie['_demo_app']
    # read from/add to cookie
    parsed_cookie = JSON.parse(cookie['_demo_app'])
    parsed_cookie += 'Hello world'
    res.set_cookie('_demo_app', parsed_cookie.to_json)
  else
    # set cookie (they don't have it)
    res.set_cookie('_demo_app', 'Hello for the first time'.to_json)
  end

  res['Content-Type'] = 'text/html'
  res.write('Checking cookies')
  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
