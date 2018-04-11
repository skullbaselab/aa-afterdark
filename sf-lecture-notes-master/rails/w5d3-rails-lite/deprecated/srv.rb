require 'rack'
require 'json'

class RackApplication
  def self.call(env)
    # p env
    # status = '200'
    # headers = {}
    # body = "Hello"
    #
    # [status, headers, body]
    req = Rack::Request.new(env)
    res = Rack::Response.new

    food = req.params['food']

    if food
      res.set_cookie('_my_app', {favorite_food: food}.to_json)
      res.write("I'll remember that your favorite food is #{food}")
    elsif req.cookies['_my_app']
      cookie = req.cookies['_my_app']
      cookie_data = JSON.parse(cookie)
      res.write("Your favorite food is #{cookie_data['favorite_food']}")
    end

    res['Content-Type'] = 'text/html'
    res.finish
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  if req.path.start_with?("/reddit")
    res['Location'] = "http://reddit.com"
    res.status = 302
  end

  res.finish
end

Rack::Server.start({
  app: app,
  Port: 3000
})
