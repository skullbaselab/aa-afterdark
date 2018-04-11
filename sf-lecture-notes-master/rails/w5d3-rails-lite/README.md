# Rails Lite

---

## Agenda
* Today's Material (1 hr)
* Quiz Solution (5 min)
* Questions from Yesterday's Assignment (5 min)

---

## Rails Review

* Router
* Controller
* Model
* View

---

## Router

* Recognizes HTTP verbs and URLs and dispatches them to a controller's action.

---

## Controller

* Receives a request and then fetches or saves data from a model and uses a view to create HTML output.

* A middleman between models and views. Makes the model data available to the view so it can display that data to the user, and it saves or updates user data to the model.

---

## Model

* Stores, validates, and retrieves data from the database.
* This is where the "business logic" and the majority of your code is.

---

## View

* Compiles the response.

* Written using either HTML & ERB or with JSON & JBuilder

---

## HTTP

* Hypertext Transfer Protocol
* 3 steps:
  * Establish a connection between the host and client
  * Client sends a **Request** to the host
  * Host send **Response** back to client
* HTTP assumes an underlying and reliable transport layer protocol
* Most common version in use is HTTP/1.1
* The HTTP/2 specification was published in May 2015.
* HTTP/2 is used by 16.6% of the top 10 million websites. (Growing rapidly!: https://w3techs.com/technologies/details/ce-http2/all/all)

---

## HTTP Requests

* `GET` & `DELETE`

```
  GET /cats/1?query=params HTTP/1.1
  Host: www.i-luv-cats.com
```
* `POST`, `PATCH`, & `PUT` Requests

```
  POST /path/name HTTP/1.1
  Host: www.example.com
  Content-Type: application/x-www-form-urlencoded
  Content-Length: 35

  name=David&currently+playing=Kendrick+Lamar
```


---

## HTTP Response
  * 1xx (informational)
  * 2xx (success)
  * 3xx (redirection)
  * 4xx (client error)
  * 5xx (server error)

```
HTTP/1.1 200 OK
Content-Length: 200
Content-Type: text/html
Date: Tues, 13 Dec 2016 04:53:35 GMT

<!DOCTYPE html>
<html>
  <!-- more html here -->
</html>
```

---

## HTTP Headers
* Set of key-value pairs that specify various properties of the HTTP request or response
* Request
  * Only one required header (in HTTP/1.1): `Host`
  * Common: `Accept`, `Content-Type`, `Cookie`, `User-Agent`
  * [More options](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Request_fields)
* Response
  * No *required* headers
  * Common: `Date`, `Content-Length`, `Content-Type`, `Set-Cookie`
  * [More options](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Response_fields)

---

## Rack
* Interface between application server and the app itself (i.e. Puma & Rails)
* What is a Rack app?
  1. an object that responds to the call method
    * can be a class or a proc
  2. takes the environment hash as a parameter
  3. returns a response
    * array with 3 values - status code, headers, and body
* Rails is just a Rack app!
* [Documentation](http://www.rubydoc.info/github/rack/rack/master/file/SPEC)

---

## Rack Environment (env)
* Contains information on the HTTP request:
  * HTTP request method
  * URL information
  * Server info (name, port)
  * HTTP meta variables
* Contains Rack-specific info:
  * version of Rack currently running
  * URL scheme (http vs https)
  * raw HTTP data
* [Documentation](http://www.rubydoc.info/github/rack/rack/master/Rack/Request/Env)
* [Example](https://stackoverflow.com/questions/17396611/what-is-the-env-variable-in-rack-middleware)

---

## Rack Request
* Use `Rack::Request` to generate a Rack request object
* Takes Rack Environment as an argument
* Not required but:
  * provides a cleaner interface than parsing the Environment object directly
  * parsing the string ourselves is error-prone and laborious
* [Documentation](http://www.rubydoc.info/github/rack/rack/master/Rack/Request)

---

## Rack Response
* Use `Rack::Response` to generate a Rack response object
* Not required to use
* Calling `res.finish` will return required response array
  * [STATUS_CODE, HASH_OF_HEADERS, BODY]
  * `['200', {'Content-Type' => 'text/html'}, ['yay for rack!']]`
* Important methods:
  * `#status=`
  * `#location=`
  * `#[]` - to set headers, i.e. 'CONTENT-TYPE'
  * `#write(message)` - append to body
  * `#finish` - converts response object to array
* [Documentation](http://www.rubydoc.info/github/rack/rack/master/Rack/Response)

---

# Demo

---

## Rails Lite Learning Goals

* Deeply understand the fundamentals of Rails by way of building it
* Understand every line of code you write in terms of its relevance to the
  method and the greater context of the web application framework
* Understand general structure of a web application framework
* Don't work on Javascript!

---

## Rails Lite Tips

* Documentation is your friend!
* Run all server files with `bundle exec`!
* Classes we will write:
  * Router & Route
  * ControllerBase
  * Session
  * Flash

---

## Quiz Review
* [Solution](https://github.com/appacademy/daily-quiz/blob/master/rails/w5d2.md)

---

## Questions from Yesterday's Assignment
* [Reddit on Rails](https://github.com/appacademy/curriculum/tree/master/rails/projects/reddit_on_rails/solution)
