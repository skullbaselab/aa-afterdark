require 'rack'

class RackApplication
  def self.call(env)
    p env
    ['200', {'Content-Type' => 'text/html'}, ["Hey there"]]
  end
end

class SimpleApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    name = req.params[:name]

    res.write("Hello, #{name}")
    res.finish
  end
end

require 'json'

class CookieApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    food = req.params['food']
    if food
      res.set_cookie('_my_cookie_app', {path: '/', value: {food: food}.to_json})
      res.write("I will remember that your favorite food is #{food}")
    else
      cookie = req.cookies['_my_cookie_app']
      cookie_val = JSON.parse(cookie)
      food = cookie_val['food']
      res.write("Your favorite food is #{food}")
    end

    res.finish
  end
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new


  if req.path.start_with?("/cage")
    res.status = 302
    res['Location'] = 'https://discdoesretro.files.wordpress.com/2013/07/tumblr_mftalf5cpv1qa934fo1_1280.png'
  else
    res.write("Nothing to see here")
  end

  res.finish
end


Rack::Server.start({
  app: app,
  Port: 3000
})

