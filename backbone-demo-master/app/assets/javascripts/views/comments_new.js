window.Todo.Views.CommentsNew = Backbone.View.extend({
  events: {
    "submit form": "submit",
    "keyup textarea": "handleKeyup"
  },

  template: JST["comments/new"],

  initialize: function (options) {
    this.todo = options.todo;
  },

  handleKeyup: function () {
    this.renderPreview();
  },

  render: function () {
    var renderedContent = this.template({
      todo: this.todo
    });

    this.$el.html(renderedContent);
    var $filePickerInput = this.$("input[type=filepicker]");
    filepicker.constructWidget($filePickerInput[0]);

    return this;
  },
  
  renderPreview: function () {
    var content = this.$("textarea").val();
    var previewContent = marked(_.escape(content));
    this.$(".preview").html(previewContent);
  },

  submit: function (event) {
    var view = this;
    
    event.preventDefault();

    var params = $(event.currentTarget).serializeJSON()["comment"];
    var comment = new Todo.Models.Comment(params);
    
    comment.save({}, {
      success: function () {
        view.todo.comments().add(comment);
        view.$('textarea[name=comment\\[content\\]]').val("");
        view.renderPreview();
      }
    });
  }
});
