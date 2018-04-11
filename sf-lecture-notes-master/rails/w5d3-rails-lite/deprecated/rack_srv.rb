require 'rack'

class RackApplication
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    name = req.params['name']
    res.write("Hello, #{name}. Nice to meet you")
    res.finish
  end
end


require 'json'

class CookieApplication
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    food = req.params['food']

    if food
      cookie = { food: food }
      res.set_cookie('_my_food_app', { path: '/', value: cookie.to_json })
      res.write("I'll remember that your favorite food is #{food}")
    else
      cookie = req.cookies['_my_food_app']
      cookie_val = JSON.parse(cookie)
      res.write("Your favorite food is #{cookie_val['food']}")
    end

    res.finish
  end
end

class CageApplication
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    if req.path.start_with?("/cage")
      res['Location'] = 'https://discdoesretro.files.wordpress.com/2013/07/tumblr_mftalf5cpv1qa934fo1_1280.png'
      res.status = 302
    end

    res.finish
  end
end

Rack::Server.start({
  app: CageApplication,
  Port: 3000
})
