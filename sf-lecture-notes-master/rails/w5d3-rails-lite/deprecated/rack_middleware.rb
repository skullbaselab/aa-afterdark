require 'rack'
require 'byebug'

class LoggerMiddleware
  attr_reader :app
  def initialize(app)
    @app = app
  end

  def call(env)
    write_log(env)
    app.call(env)
  end

  private

  def write_log(env)
    log_file = File.open('application.log', 'a')
    log_text = <<-LOG
    TIME: #{Time.now}
    IP: #{env['REMOTE_ADDR']}
    PATH: #{env['REQUEST_PATH']}
    ____________________________\n
    LOG
    
    log_file.write(log_text)
    log_file.close
  end
end

class BrowserFilter
  attr_reader :app
  
  def initialize(app)
    @app = app
  end

  def call(env)
    res = Rack::Response.new

    if env["HTTP_USER_AGENT"].include?("MSIE")
      res.status = 302
      res['Location'] = 'https://www.google.com/chrome/'
      res.finish
    else
      app.call(env)
    end
  end
end

hey_app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new

  res['Content-Type'] = "text/html"

  file = File.open('index.html', 'r')
  lines = file.read

  res.write(lines)

  res.finish
end

app = Rack::Builder.new do
  use BrowserFilter
  use LoggerMiddleware
  run hey_app
end.to_app

Rack::Server.start({
  app: app,
  Port: 3000
})
