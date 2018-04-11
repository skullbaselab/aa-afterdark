require 'rack'
require 'byebug'

# app = Proc.new do |env|
#   [
#     200,
#     { 'Content-Type' => 'text/html' },
#     ['Hello, world!']
#   ]
# end

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res.write("Hello, App Academy!")
#   res.finish
# end

# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   debugger
#   res = Rack::Response.new
#   res.write("Hello, globe!")
#   if req.cookies["cookie"]
#     cookie_val = req.cookies["cookie"]
#   else
#     cookie_val = "42"
#   end
#   res.set_cookie("cookie", { value: cookie_val })
#   res.finish
# end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  if req.path == "/cats"
    res.status = 302
    res["Location"] = "https://i.pinimg.com/736x/8e/9f/c4/8e9fc4c7273462695311fe46dff7420b--real-life-this-my-life.jpg"
  elsif req.path == "/dogs"
    res["Content-Type"] = "text/html"
    res.write('<img src="http://cdn2-www.dogtime.com/assets/uploads/2014/05/file_19776_column_dog-wearing-a-im-friendly-please-ask-to-pet-me-vest.jpg" />')
  else
    res.write("Hello, cat!")
  end
  res.finish
end

Rack::Server.start({ app: app, Port: 3000 })

















# end of document
