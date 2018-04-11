require 'rack'
require 'byebug'
require 'json'


app = Proc.new do |env|
  debugger
  ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
end

redirect_app = Proc.new do |env|
  [
    '302',
    {'Content-Type' => 'text/html', 'Location' => 'https://google.com'},
    ['Go to Google instead']
  ]
end

Rack::Server.start(
  app: redirect_app,
  Port: 3000
# )



######### Rack::Request and Rack::Response

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   debugger
#   res['Content-Type'] = 'text/html'
#   res.write('more complex Rack app!') # always use this to edit the body!!
#
#   res.finish
# end
#
# Rack::Server.start(
#   app: app,
#   Port: 3000
# )



######### Cookies
#
# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res['Content-Type'] = 'text/html'
#
#   if req.cookies['messages']
#     messages = JSON.parse(req.cookies['messages'])
#   else
#     messages = []
#   end
#
#   if req.params['message']
#     messages << req.params['message']
#     # res['Set-Cookie'] => NO NO NO- Don't do this!!!
#     res.set_cookie('messages', {
#       value: messages.to_json
#     })
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

# class RoutingApp
#   def self.call(env)
#     req = Rack::Request.new(env)
#     res = Rack::Response.new
#
#     res.status = '200'
#     res['Content-Type'] = 'text/html'
#     handle_routing(req, res)
#
#     res.finish
#   end
#
#   # look at rubular.com
#   def self.handle_routing(req, res)
#     if req.path == '/cat'
#       res.write('<a href="http://www.sennacy.com/">Sennacy</a>')
#
#     elsif req.path == '/dog'
#       html = <<-HTML
#         <a href="http://www.cherishedswissies.com/images/pond.jpg">
#           Puppy
#         </a>
#       HTML
#       res.write(html)
#
#     else
#       res.write("Why aren't you looking for a cat or dog, heartless monster?")
#     end
#   end
#
# end
#
#
#
# Rack::Server.start(
#   app: RoutingApp,
#   Port: 3000
# )
