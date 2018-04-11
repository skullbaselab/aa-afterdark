require 'rack'
require 'byebug'
require 'json'

# Whatever responds to the call method, must return an array with the
# three elements inside: status, headers, body/content
# app = Proc.new do |env|
#   ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
# end

# redirect_app = Proc.new do |env|
#   [ '302', { 'Location' => 'http://google.com' }, [] ]
# end

# The app passed MUST respond to the call method
# Rack::Server.start(
#   app: redirect_app,
#   Port: 3000
# )


######### Rack::Request and Rack::Response

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res['Content-Type'] = 'text/html'
#   res.write('more complex Rack app!')
#
#   a = res.finish
#   p a
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
#     debugger
#     messages = JSON.parse(req.cookies['messages'])
#   else
#     messages = []
#   end
#
#   if req.params['message']
#     messages << req.params['message']
#     debugger
#     # res['Set-Cookie'] = { 'test' => 'words' }.to_json
#     res.set_cookie('messages', {
#       value: messages.to_json,
#       path: '/secret'
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

class RoutingApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    handle_routing(req, res)

    res.finish
  end

  def self.handle_routing(req, res)
    if req.path == '/cat'
      res.write('<a href="http://www.sennacy.com/" target="_blank" >Sennacy</a>')

    elsif req.path == '/dog'
      html = <<-HTML
        <a href="https://s3.amazonaws.com/tommy-personal/Lola.jpeg" target="_blank">
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
