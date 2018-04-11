## order
- HTTP request with netcat
- Two generals problem
  - one sends a messenger to his lieutenant, asks for confirmation
  - if the general gets a confirmation messenger, he knows his message has been
  received
  - but his lieutenant doesn't know that the general got his confirmation, so the
  general has to send a confirmation confirmation messenger
  - but then the general doesn't know if the lieutenant got his confirmation confirmation,
  so the lieutenant has to send yet another messenger, etc. etc.
- 2 generals like client and server
  - can't be 100% certain that the other knows you know they know etc. with finite messengers
- introduce TCP (Transmission Control Protocol)
  - solves this problem (sort of) by sending potentially infinite retries
- talk about URL into browser

## HTTP
- Request/Response
- headers
- body
- cookies
- requirements for valid request
  - method
  - path
  - host

## What happens when you type a URL into your browser
- type "http://www.google.com" into address bar
  - need to turn this into IP address (e.g. 199.241.200.248)
- Check cache (if cache hit, skip straight to decoding the response)
- Browser asks OS for server's IP (if OS has it stored, skip to the TCP connection)
- OS performs DNS lookup and returns the IP to the browser
  - root query (find where the .com TLD name server is)
  - TLD server query (find where one of google's name servers is)
  - Google name server query (returns the IP of www.google.com)
- Browser opens TCP connection to server
- Browser sends HTTP request through TCP connection
  - This is what Rails gets and where your controllers kick in. They
  generate the response based on the logic you write.
  - Important parts:
    - http method (GET, POST, DELETE, PUT)
    - domain (your rails app's domain: e.g. 'localhost:3000')
    - path ('/' by default)
- Browser receives response
- Browser decodes response (cache hit leads here)
  - depending on type of response, browser behaves differently. Assuming
  it is a normal response (2xx), it renders the content.

## 7 layers of OSI (open systems interconnection) model
These are the layers of abstraction on which all of our web applications sit:
1. Application Layer
  - this is what you see
  - handles HTTP requests and responses
2. Presentation Layer
  - converts the data into format understood by the network
3. Session Layer
  - sets up connections between systems
4. Transport Layer
  - turns the information into data packets (TCP)
5. Network Layer
  - this manages the route the data takes to get between systems
  - node to node routes
6. Data Link
  - packets are turned into bits (highs and lows)
7. Physical Layer
  - hardware. The infrastructure which conveys the bits between systems


## WEBrick

### ::HTTPRequest / ::HTTPResponse

## more info
- how does TCP work
  - how does it relate to UDP (User Datagram Protocol)?
    - TCP prioritizes data integrity over speed
    - UDP might lose packets
- Hostname requirement in header
  - if server is virtual host it won't have its own IP address to distinguish itself
  from other virtual hosts
- expiry dates on the browser cache
  - expires header in the HTTP response
- DNS lookup: how it goes in stages
  - root
  - TLD
  - local name server
- virtual domains
- load balancing
