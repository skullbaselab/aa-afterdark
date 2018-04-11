require 'rack'
require 'json'

boring_app_with_proc = Proc.new do
  puts 'I got a request! Time to respond!'
  ['200', {}, ['Proc#call is a useful method!']]
end

class BoringApp
  def self.call(env)
    status = '200'
    headers = { 'Content-Type' => 'text/html' }
    body = ['This response has a body!']

    [status, headers, body]
  end
end

class RackResponseApp
  def self.call(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    res['Meaningless-Header'] = 'Whatever!'
    res.write('<a href="/">Make another request!</a>')

    res.finish
  end
end

class RackRequestApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    res.write("You made it to <b>#{req.path}</b>!")

    res.finish
  end
end

class ParamsApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    res.write('I have a secret! ')
    write_secret_to_body(req, res)

    res.finish
  end

  def self.write_secret_to_body(req, res)
    if secret = req.params['secret']
      res.write("I love #{secret}! Also, it's not a secret.")
    else
      res.write("But I will never tell!")
    end
  end
end

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
      res.write('<a href="http://www.sennacy.com/">Sennacy</a>')
    elsif req.path == '/dog'
      res.write('<a href="http://www.tntdownunder.com/image.php/media/content/_master/49183/images/dog-2012-labrador-retriever.jpg?file=media%2Fcontent%2F_master%2F49183%2Fimages%2Fdog-2012-labrador-retriever.jpg&width=450">Puppy</a>')
    else
      res.write("Why aren't you looking for a cat or dog, heartless monster?")
    end
  end
end

class CookieApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    handle_routing(req, res)

    res.finish
  end

  def self.handle_routing(req, res)
    if req.path == '/add_dog' && req.params['name']
      set_doggy_cookie!(req, res)
      res.write("Dog added!")

    elsif req.path == '/dogs'
      res.write('<h1>All the dogs:</h1>')
      res.write(dog_list(req.cookies['dogs']))

    else
      res.status = '404'
      res.write("Nothing to see here!")
    end
  end

  def self.set_doggy_cookie!(req, res)
    doggy_cookie = req.cookies['dogs']
    dogs = doggy_cookie ? JSON.parse(doggy_cookie) : []
    dogs << req.params['name']

    res.set_cookie('dogs', value: dogs.to_json, path: "/")
  end

  def self.dog_list(doggy_cookie)
    dogs = JSON.parse(doggy_cookie)
    '<ul><li>' + dogs.join('</li><li>') + '</li></ul>'
  end
end

class RedirectApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    handle_routing(req, res)

    res.finish
  end

  def self.handle_routing(req, res)
    if req.path == '/add_dog' && req.params['name']
      set_doggy_cookie!(req, res)
      res.status = '302'
      res['location'] = '/dogs'

    elsif req.path == '/dogs'
      res.write('<h1>All the dogs:</h1>')
      res.write(dog_list(req.cookies['dogs']))

    else
      res.status = '404'
      res.write("Nothing to see here!")
    end
  end

  def self.set_doggy_cookie!(req, res)
    doggy_cookie = req.cookies['dogs']
    dogs = doggy_cookie ? JSON.parse(doggy_cookie) : []
    dogs << req.params['name']

    res.set_cookie('dogs', value: dogs.to_json, path: "/")
  end

  def self.dog_list(doggy_cookie)
    dogs = JSON.parse(doggy_cookie)
    '<ul><li>' + dogs.join('</li><li>') + '</li></ul>'
  end
end

# Rack::Server.start({
#   app: RedirectApp,
#   Port: 3000
# })

Rack::Handler::WEBrick.run(RedirectApp, Port: 3000)
