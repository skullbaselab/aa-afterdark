//=====WebSockets=====

//WebSockets are different than HTTP

//=====Node.js=====

//Connection via socket stays open for a long time, it allows 2 way communication

//Node is happy to have multiple connections open simult.
//Rails wants to have one conn. open at a time
// The HTTP request/response from client to server
// Rails wants to service a request, send data, close it, and move on
// Node says open a connection, and then deal with other connections simult.
// Node has better concurrency
// You can do the same thing in Rails, but you have to fight the nature of rails

// It makes a lot of sense to use Node.js for websockets
// For standard HTTP stick with Rails

//=====Demo of node.js=====

// buffer to string
// buffer.toString();
// it's not really a string, but you can write it to the response
// because the response will take binary data

// npm install socket.io

// demonstrates how require and exports work

exports.Dog = function Dog (name ) {
  this.name = name;
}

exports.Cat = function Cat (name) {
  this.name = name;
}

//Just don't say 'exports = Dog...' and overwrite the exports obje.

exports == module.exports;

//and it needs to stay this way

module.exports = function Dog (name) {
  this.name - name;
}

// =====HOW IT WORKS UNDER THE HOOD=====

// in the old days, the OS knew how to do IO operations, so you asked
// the OS to do those things
// in the past 5 years or so (more) they added async IO
// you can delegate operations to the OS
// just 'let me know' when it's done
// the entire computer is event-driven at it's core
// you don't need to start a new thread or process to read the files
// node uses async IO to do this
// How does it do all the things?
// It does IO operations simultaneously
// like AJAX in the browser
//


// he explains events in a queue


// how to get things async to happen in a ceratin order

// library node async

var numCalls = 0;

function maybeClose() {
  if (numCalls == 0) {
    numCalls += 1;
    return;
  } else if (nuMCalls == 1) {
    res.end();
  }
}

// You must nest callbacks
// or use async library

//How does this work in conjunction with rails?

// Set up Rails first
// Then set up a node server to run side-by-side with Rails server
// have Rails import socket.io on client side
// different ports for the two servers
//
