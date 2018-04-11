require 'rack'
require 'byebug'

# COOKIES!
# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#   res.write("<h1>COOKIE PARTY COOKIE PARTY COOKIE PARTY!</h1>")
#   if req.cookies["cookie_party"]
#     res.write("<h2>We have cookies for our party.</h2>")
#   else
#     res.write("<h2>Oh no! No cookies! Refresh to make some</h2>")
#   end
#   res.set_cookie("cookie_party", { value: true })
#   res.finish
# end


###########################

# ROUTING!
# app = Proc.new do |env|
#   req = Rack::Request.new(env)
#   res = Rack::Response.new
#
#   res["Content-Type"] = "text/html"
#
#   if req.path == "/cool"
#     res.write('<img src="https://i.pinimg.com/236x/5f/21/99/5f2199d7f988d11529ddd8e64cec9ebb--corgi-welsh-nature-animals.jpg" />')
#   elsif req.path == "/silly"
#     res.write('<img src="https://i.pinimg.com/originals/3f/4d/74/3f4d74232dfac43c377a1b93e66c931a.jpg" />')
#   elsif req.path == "/thor"
#     res.write('<img src="http://www.11points.com/images/dogheroes/thor.jpg" />')
#   else
#     res.write('404!!!')
#   end
#
#   res.finish
# end

# Rack::Server.start(
#   app: app,
#   Port: 3000
# )

#########################

# LET'S GET FANCY!
class RoutingApp
   def self.call(env)
     req = Rack::Request.new(env)
     res = Rack::Response.new
     debugger
     res.status = '200'
     res['Content-Type'] = 'text/html'
     handle_routing(req, res)

     res.finish
   end


   def self.handle_routing(req, res)
     if req.path == '/corgi'
       res.write('<h1>CORGI</h1><img src="https://i.pinimg.com/236x/5f/21/99/5f2199d7f988d11529ddd8e64cec9ebb--corgi-welsh-nature-animals.jpg" />')

     elsif req.path == '/list'
       html = <<-HTML
         <h1>Things That Got Stolen From Me</h1>
         <ul>
           <li><h2>My dictionary.</h2></li>
           <li><h2>My thesaurus.</h2></li>
           <li><h2>My mood ring.</h2></li>
         </ul>
       HTML
       res.write(html)

     else
       res.write("404 NOT FOUND, LOSER!")
     end
   end

 end

Rack::Server.start(
  app: RoutingApp,
  Port: 3000
)
