JournalApp.Views.PostForm = Backbone.View.extend({
  events: {
    'submit form': 'submit'
  },

  template: JST['posts/form'],

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template({
      post: this.model
    });
    this.$el.html(renderedContent);

    return this;
  },

  submit: function (event) {
    event.preventDefault();

    var attrs = $(event.target).serializeJSON();

    var success = function () {
      this.collection.add(this.model);
      Backbone.history.navigate('#/posts/' + this.model.id, { trigger: true });
    }.bind(this);

    function errors(model, response) {
      $('.errors').empty();
      response.responseJSON.forEach(function (el) {
        var $li = $('<li></li>');
        $li.text(el);
        $('.errors').append($li);
      }.bind(this));
    }

    this.model.save(attrs, {
      wait: true,
      success: success,
      error: errors.bind(this)
    });

  }
});
