require 'rack'
require 'byebug'
require 'json'

######### Intro
# http://rack.github.io/

# 'env' is the environment hash given to us from the server
# app = Proc.new do |env|
#     ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
# end


######### Rack::Request and Rack::Response

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#
#   if req.path == '/cats'
#     res.write(File.read('cats.html'))
#   elsif req.path == '/dogs'
#     res.write(File.read('dogs.html'))
#   else
#     res.status = 404
#     res.write(File.read('404.html'))
#   end
#
#   res.finish
# end


######### Cookies

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  cookie = req.cookies['message'] ? JSON.parse(req.cookies['message']) : []

  if req['secret']
    cookie << req['secret']
    res.set_cookie('message', { value: cookie.to_json })
  end

  res.write(cookie)

  res.finish
end



Rack::Server.start(
  app: app,
  Port: 3000
)
