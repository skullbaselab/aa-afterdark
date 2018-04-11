var http = require('http'),
    static = require('node-static'),
    socketio = require('socket.io');

var file = new static.Server('../public');

var server = http.createServer(function (request, response) {
  request.addListener('end', function () {
    file.serve(request, response);
  }).resume();
});

server.listen(8000);

var io = socketio(server);
io.on('connection', function (socket) {
  socket.emit('post', { message: 'hello you!' });
  socket.on('message', function (data) {
    console.log(data.message);
    io.sockets.emit('post', { message: data.message })
  });
});
