require 'rack'
require 'byebug'
require 'json'


# app = Proc.new do |env|
#   ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
# end

# redirect_app = Proc.new do |env|
#   [
#     '302',
#     {'Content-Type' => 'text/html', 'Location' => 'https://google.com'},
#     ['Go to Google instead']
#   ]
# end

#Rack apps must respond to #call and return 3 element array
#Procs have #call method so they are convenient to user
# Rack::Server.start(
#   app: redirect_app,
#   Port: 3000
# )



######### Rack::Request and Rack::Response
# my_proc = Proc.new do |argument|
#   puts argument
# end
# my_proc.call("Tassos is awesome")

# app = Proc.new do |env|
#   #env variable given to us by Rack
#   #holds all the info about request and environment
#   req = Rack::Request.new(env)
#   #we make a rack request object to get a nice interface with request
#   res = Rack::Response.new
#   #response starts out blank. It's our job to build it up.
#   res['Content-Type'] = 'text/html'
#   res.write('more complex Rack app!') # always use this to edit the body!!
#   # #write appends to body and updates content length
#   res.finish
#   #finish turns response obj into 3 element array
# end
#
# Rack::Server.start(
#   app: app,
#   Port: 3000
# )



######### Cookies

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res['Content-Type'] = 'text/html'
#
#   if req.cookies['messages']
#     messages = JSON.parse(req.cookies['messages'])
#     # JSON.parse will de-serialize cookie string into its data type
#   else
#     messages = []
#   end
#
#   if req.params['message']
#     # we have access to params from query string and request body at this point
#     messages << req.params['message']
#     # res['Set-Cookie'] => NO NO NO NO NO NO
#     res.set_cookie('messages', {
#       value: messages.to_json
#     })
#     # we can only send strings over the wire, so we call #to_json to serialize object into string
#   end
#
#   res.write(messages)
#   res.finish
# end
#
# Rack::Server.start(
#   app: app,
#   Port: 3000
# )




######## Class app

class RoutingApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    handle_routing(req, res)

    res.finish
  end

  # look at rubular.com
  def self.handle_routing(req, res)
    if req.path == '/cat'
      res.write('<a href="http://www.sennacy.com/">Sennacy</a>')

    elsif req.path == '/dog'
      html = <<-HTML
        <a href="http://www.cherishedswissies.com/images/pond.jpg">
          Puppy
        </a>
      HTML
      res.write(html)

    else
      res.write("Why aren't you looking for a cat or dog, heartless monster?")
    end
  end

end

Rack::Server.start(
  app: RoutingApp,
  Port: 3000
)
