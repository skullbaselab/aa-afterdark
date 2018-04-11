require 'rack'

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  # p env
  # require 'byebug'
  # debugger
  if req.user_agent.include?("Chrome")
    # res['Content-Type'] = 'text/plain'
    res['Content-Type'] = 'text/plain; charset=utf-8'
    res.write("All the cool kids use Chrome 😎. Safari stinks! 💩")
  else
    res.status = 302
    res['Location'] = "https://www.google.com/chrome"
  end

  res.finish
end

Rack::Server.start(
  app: app,
  Port: 3000
)
