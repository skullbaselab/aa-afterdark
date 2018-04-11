App.Models.Todo = Backbone.Model.extend({
  urlRoot: "/api/todos",

  comments: function () {
    this._comments = this._comments ||
      new App.Collections.TodoComments([], { todo: this });
    return this._comments;
  },

  parse: function (payload) {
    if (payload.comments) {
      // We can get away without `{ parse: true }` here, but it is
      // common to put it in. Using the `parse` option will ensure
      // that the Comment JSON is passed to `Comment#parse`, which
      // will ensure that data even further nested inside a comment
      // will be parsed.
      //
      // As a rule, inside the `parse` method, pass `{ parse: true }`
      // to methods that build more objects.
      this.comments().set(payload.comments, { parse: true });
      delete payload.comments;
    }

    return payload;
  }
});
