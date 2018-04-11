require 'rack'
require 'json'
require 'byebug'

# https://rack.github.io/

##################
# Basic Rack App #
##################

app = Proc.new do |env|
  puts 'I got a request! Time to respond!'

  [
    '200',
    { 'Content-Type' => 'text/html' },
    ['This response has a body!']
  ]
end

#############################
# Rack Request and Response #
#############################

class RackRequestApp
  def self.call(env)
    req = Rack::Request.new(env)
    res = Rack::Response.new

    res.status = '200'
    res['Content-Type'] = 'text/html'
    # NB: avoid #body= as it will overwrite the entire res body
    #     -- use .write to append to body instead
    res.write("<p>You made it to <b>#{req.path}</b>!</p>")
    res.write("<p>My secret is: <b>#{req.params['secret']}</b></p>")

    res.finish # wrap everything up into the array format that rack expects to see
  end
end

#############
# And more! #
#############

class AwesomeApp
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
    # cookies saves in JSON format
    dogs = doggy_cookie ? JSON.parse(doggy_cookie) : []
    dogs << req.params['name']

    res.set_cookie('dogs', value: dogs.to_json, path: "/")
  end

  def self.dog_list(doggy_cookie)
    dogs = JSON.parse(doggy_cookie)
    '<ul><li>' + dogs.join('</li><li>') + '</li></ul>'
  end
end

Rack::Server.start({
  app: AwesomeApp,
  Port: 3000
})
