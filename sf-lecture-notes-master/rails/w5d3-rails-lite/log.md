# 12/10/18

* Lecturer: Ned
*  Logger: Jesse

## Questions

### TCP
+ WHat if it is never received, will it just keep sending?
  + yes, if an acknowledgment is never received it will keep sending until it times out
+ what does PSH stand for?
  + great question, i don't know
+ is the acknowledgment like a ping?
  + similar in that it sends no real data other than a sequence so that the connection has a record of what has been sent AND received

### Rack/middleware
+ what is this repo?
  + https://github.com/ruggeri/networking-lecture

# 11/1/17

* Lecturer: Ned
* Note-taker: Andres

## Questions

### TCP

+ Are all the entries in wireshark the hand-shake?
  + Yes they where, acknowledgment between 2 computers.
+ Is the size for a package fixed?
  + It is part of TCP, where the involved parties agree on the packet size.
+ Can you receive duplicate packages with the same sequence number?
  + Yes and that is totally ok, because the protocol will dismiss the duplicated packet.

### HTTP

+ Can you change the expire header on a response?
  + This is set by the server responding to our request.
+ Is there an ack when the client receive the response?
  + Yes there is, however the _acks_ are handled at _TCP_ level, not _HTTP_.
+ How was the IP address involved in all of this (netcat lookup on google.com)?
  + While connecting to google we used the domain, however a DNS translated that into an IP address.
+ Can you have 2 domains associated with the same IP Address.
  + Yes you can, this is a common practice called _Shared Web Hosting_.
+ What do you mean by port?
  + If I want to connect to your computer I need your IP address, but to access a particular program/processes you need such port.


### HTTP requests

+ What determines when a request timeouts?
  + The client determines that.
+ How do you set scripts and stylesheets (in the initial html response)?
  + There will be more requests required, and those will have different content-types.

### Rack/middleware

+ WHen exactly are you calling the _call_ method?
  + Rack is going to start the puma server on a specific _socket_, the client will open a connection to the _socket_. *__Puma__* parses the request and passes the request to *Rack*, *Rack* then invokes the *__call__* method.
+ Can you show us what _env_ is?
  + Is a _hash_ with a lot of information.

No questions on code demo nor quiz.


# 8/30/17

* Lecturer: David
* Note-taker: Isak

## Questions

### HTTP

* Are there drawbacks to using HTTP 2?
  * Not really, if it's an old machine it'll just send a 'try again'.
* Can we use Rails use HTTP 2?
 * Not our decision, happens under the hood in your server/Rack.

### HTTP requests

* _(David explains that traditional `PUT` replaced but `PATCH` modified)_ If I use `PUT` instead of `PATCH` will it not work?
  * No it's fine, dude.

### Rack/middleware

* Do all gems work through Rack?
  * No, gems can be anything.
* Does Rack need to know how to talk with every browser?
  * No, Rack just needs to know how to talk with every web server.
* Is Rack a server?
  * Yes, it is. It serves Rails and serves the web server.
* Is Rack part of Rails?
  * No, it is not a part of Rails, many frameworks use it.

No questions on code demo nor quiz.

# August 30, 2017

Lecturer: David Dobrynin
Scribe: Kelly Chung

### Lecture Questions

1. Are there drawbacks to using HTTP2?
  + Not really - other than people being unfamiliar with the standard?
1. Do we use HTTP2?
  + That is not something you specify as a developer on Rails - handled by Rack.
1. Differences between patch + put?
  + PUT is replacing an entire object, whereas PATCH will update specific attributes.
1. Do all gems work through Rack?
  + I'm not sure that it's fair to make that assumption.
1. Does Rack need to know how to talk with every browser?
  + Nope, just needs to know how to talk with every server?
1. Can we show the headers and the body again?
  + Sure. *goes through code*
1. Can we see the command to see all your middleware?
  + `rails middleware` much like `rails routes`
1. Can you use a lambda instead of a proc in this function?
  + Given that lambdas are derivatives from procs, I'd assume you'd be able to.
1. Is Rack consider a server?
  + Yes. It's serving the web server and the app.
1. Would you consider Rack to be a part of Rails?
  + No - it's a general program in the Ruby community. Can be used with other frameworks.
1. If you look at the MVC model - where is Rack?
  + Outside of the MVC model - server communicates with the router, which connects with the controller.
1. Where is the Rack documentation?
  + Google it - it's the first thing that pops up

# 6/27/17

Lecturer: Shamayel

Scribe: Elliot

## Questions

### HTTP

#### Q: What makes something backward compatible
A: Not sure

#### Q: Client vs Host
A: Server is host (aka a google server); client is user's machine (browser sending requests)

#### Q: What is ```\n```?
A: Newline characters

#### Q: Can you go over type?
A: Content-type tells the browser what type of data we will be getting in the response so it can properly work with the data (aka render)

### Rack

#### Q: What's the router again?
A: Essentially the routes file (part of Rails)

#### Q: Is Rack the only option in as the middleperson?
A: It is the standard/most prominently used one between Ruby webservers and web application frameworks. Other languages use other interfaces.

#### Q: How does the Rack environment relate to the environment hash passed in?
A: When we create a new Rack::Request object, we pass the env string and it parses it for us.

#### Q: We are using a proc because it already has call; could we create a class and define a call method?
A: Yes that would work

#### Q: What's diff between putting something in res hash (```res['Content-type']```) vs calling res methods (```res.write()```)?
A: res hash: use for building headers; res methods: use for setting body

#### Q: Go over first lines of code in demo?
A: 1st line, setting up our ```Proc``` (passing in the ```env``` because ```Rack``` expects something you can call ```call``` on.

2nd line: once we have ```env``` (from passing in ```Proc```), we create a ```Request``` object using that ```env```. This does the parsing of ```env``` for us. We also create an empty ```Response``` object.

### Quiz

#### Q: At what point is information being sent packets?
A: As soon as they leave the client; they are the method of transmission. Rack will send a response to the webserver; the webserver will parse it and send back packets to client.

#### Q: Where do we go to see the results of the middleware?
A: Rack::Builder, any print statements will show up in the server logs.

---

# 2/21/2017
Lecturer: Claire

## Questions
- What is the "::" in ActionController::Base
- What is the argument for having classes inherit from each other?
- Is the Rack response/request json?
- Are there limits on how much info is set in cookies?
- Is the cookie mutable? Can the route change the response?
- How would we use the Rails server? Are we writing that?

## Mistakes
* Not watching the lecture videos

## Notes
* There were no questions on the previous day's project
* Due to a04, most students had not watched the lecture videos, so there were very few questions



# w5d2

# 12/13/2016
Lecturer: Claire

## Questions
* Who was in the capybara suit? :tiger:
* Do we need a newline after each line in the header?
* Is `app` a server?

## Mistakes
* How middleware is instantiated vs invoked
* Not watching the lecture videos

## Notes
* I demoed how to use Rack, which I think was helpful
* There were no questions on the previous day's project
* Need to fix a/A logo image link in html/css curriculum (for day 2, I believe)
* Due to a04, most students had not watched the lecture videos, so there were very few questions


# 8/9/2016
Lecturer: Jeff

## Common Mistakes

## Questions from Yesterday
* What should we actually be testing? Should we see if something is actually persisted to the database?
* Can we access instance variables in the controller test?

## QA Questions
* Are we building Rack?
* What is Rack?

## Notes

# 6/7/16
Lecturer: Max

## Common Mistakes
- Rails basics

## Questions from Yesterday
- let vs let!
- unit tests vs feature tests
- rspec speed?
## Q&A Questions
- Why Rails? What about other frameworks?
  + Popularity and Ease. Today's project helps understand all frameworks.
- Details about Rack Middleware
  + Push question to following day more about middleware
- Why do we need Rack?
  + Web Server has to parse String. Web Framework gives back Ruby Object not a
    String and parsing that string is extra work outside the scope of a
framework. Divison of labor was reached. With many frameworks and many servers
the middleware also serves as a standard for turning ruby objects into HTTP
string.


## Notes

### Corrections for Quiz
- change regex question to match instead of capture
- change response status code question
