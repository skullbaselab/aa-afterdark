var ChatMachine = function ($form, $list) {
  this.$form = $form;
  this.$list = $list;
  this.$form.on("submit", this.submitMessage.bind(this));
};

ChatMachine.prototype.submitMessage = function (e) {
  e.preventDefault();
  var text = this.$form.find("input[name='message[text]']").val();
  var author = this.$form.find("input[name='message[author]']").val();
  this.$loader = $('<div class="loader">Loading...</div>');
  this.$list.append(this.$loader);
  $.ajax({
    url: "/messages",
    type: "POST",
    dataType: 'json',
    data: {
      message: {
        author: author,
        text: text
      }
    },
    success: function (message) {
      this.$loader.remove();
      this.addMessageToList(message);
    }.bind(this)
  })
};

ChatMachine.prototype.addMessageToList = function (message) {
    var messageLi = "<li>" + message.author + ": " + message.text + "</li>";
    this.$list.append(messageLi);
};

module.exports = ChatMachine;
