# Rails Lite

+ Networking 101
  + Layers (like Ogres
  + HTTP
+ Demo
  + Server

---

# Networking 101
### Layers

1. Physical
+ Data Link
+ Network
+ Transport
+ Session
+ Presentation
+ Application

---

# HTTP

+ Body
+ Headers
+ Method
+ Cookies

---

Server Demo:

```rb
require 'webrick'

server = WEBrick::HTTPServer.new(Port: 8000)
trap('INT') { server.shutdown }

server.mount_proc '/' do |req, res|
  res.body = "hello world"
end

server.start
```

---

Headers Demo:

```rb
res.status = 302
res["Location"] = "http://google.com"
```

---

Cookies Demo:

```rb
res.cookies << WEBrick::Cookie.new('name', 'value')
```

---

`instance_eval` Demo:

```rb
class Trip
  def snorkeling
    puts "snorkeling!"
  end

  def jet_skis
    puts "jet skis!"
  end

  def plan(&prc)
    instance_eval(&prc)
  end
end


jamaican_vacation = Trip.new
jamaican_vacation.plan do
  snorkeling
  jet_skis
  snorkeling
  snorkeling
end
```
user[address][street][number]=1&user[address][street][name]=main

{user => { address => { street => { name => "main", number => 1 }}}}

