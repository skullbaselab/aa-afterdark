HTTP - HyperText Transfer Protocol. HTTP is the underlying protocol used by the World Wide Web and this protocol defines how messages are formatted and transmitted, and what actions Web servers and browsers should take in response to various commands.

REST - Representational State Transfer or RESTful web services is a way of providing interoperability between computer systems on the Internet.
  - Rest is just a way of describing how our API should work. In using REST, we'll utilize a set of standard methods and their expected responses.

JSON - JavaScript Object Notation is a lightweight data-interchange format. It is easy for humans to read and write. It is easy for machines to parse and generate. It is based on a subset of the JavaScript Programming Language, Standard ECMA-262 3rd Edition - December 1999.

HTTP request comprised of:
  - method: GET, POST, PUT/PATCH, DELETE
    - GET = 'gimme some stuff'
    - POST = 'make this thing'
    - PUT/PATCH, both basically mean 'update this thing', but slightly diff for historical reasons
      - for PUT, you send everything even the parts you didn't change. could be edit or create
      - for PATCH, you only send the part you changed. You'll mostly use this one 👌🏼
    - DELETE = 'delete this thing'
  - path: a string specifying the resource requested (i.e. /tweets/5)
  - query string: optional string data following a `?` that may further specify the resource requested
  - header fields: extra information for the server, such as content type and client software
  - body: contains data from the client

HTTP response comprised of:
  - status code: number value indicating the type of response (success, redirect, client error, server error)
    - 200 = OK 👌🏼
    - 404 = RESOURCE NOT FOUND❓
    - 422 = UNPROCESSABLE ENTITY (usually for bad form input, eg a tweet with no body)
    - 302 = FOUND (but redirect)
    - 418 = I'M A TEAPOT - this one is a joke, don't use it plz
    - 500 = INTERNAL SERVER ERROR 💀 (this is the one that gets people fired - Oscar Alvarez)

    - In Rails, 200 is the default status code, but when we make our responses we can specify different statuses

  - body: data, could be HTML or other serialized data format such as JSON
    - JSON = JavaScript Object Notation. It's a way to create simple lightweight objects, typically key-value pairs, that can easily be read by both humans and machines.

HTTP is stateless. It does not persist any data between request-response cycles.

## Rails
  - Router: decides which controller a particular request will hit, eg GET '/tweets' should hit TweetsController#index
  - Controller: decides what response to build
  ...we'll talk about views tmrw :)
  
