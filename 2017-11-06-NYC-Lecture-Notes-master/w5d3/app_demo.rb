######## Class app
require 'rack'
require 'json'
require 'byebug'

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
    # take in a request
    # decide what response to build based on the path
    if req.path == '/cat'
      res.write("<a href='http://www.sennacy.com/'>Sennacy</a>")
      res.write("Click this for Cute Cat")
      res.finish
    elsif req.path == '/dog'
      res.write(<<-HTML
                <a href="http://www.cherishedswissies.com/images/pond.jpg">
                Puppy
                </a>
                HTML
                )
      res.write('Click this for better dog')
      res.finish
    end
  end

end

dog = <<-HTML
        <a href="http://www.cherishedswissies.com/images/pond.jpg">
          Puppy
        </a>
      HTML
# cat = '<a href="http://www.sennacy.com/">Sennacy</a>'

Rack::Server.start(
  app: RoutingApp,
  Port: 3000
)
