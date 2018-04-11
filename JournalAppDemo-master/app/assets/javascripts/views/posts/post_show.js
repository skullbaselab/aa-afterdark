JournalApp.Views.PostShow = Backbone.View.extend({
  template: JST['posts/show'],

  events: {
    'click .delete': 'destroyPost',
    'dblclick .editable': 'editField',
    'blur .edit-input': 'saveField',
  },

  destroyPost: function (event) {
    this.model.destroy();
    Backbone.history.navigate('', { trigger: true });
  },

  editField: function (event) {
    event.preventDefault();
    var $currentTarget = $(event.currentTarget);
    var field = $currentTarget.data('field');
    var $input = $("<input class='edit-input'>");

    $input.data('field', field);
    $input.val(this.model.escape(field));
    $currentTarget.removeClass('editable');
    $currentTarget.html($input);
    $input.focus();
  },

  initialize: function(options) {
    this.listenTo(this.model, 'sync', this.render);
  },

  saveField: function (event) {
    event.preventDefault();
    var field = $(event.currentTarget).data('field');
    var newVal = $(event.currentTarget).val();

    this.model.set(field, newVal);
    this.model.save();
    this.render();
  },

  render: function () {
    var renderedContent = this.template({
      post: this.model
    });
    this.$el.html(renderedContent);

    return this;
  }
});
