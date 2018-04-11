// I prefer naming the topmost namespace `App` for simplicity.
window.App = {
  Collections: {},
  Models: {},
  Routers: {},
  Views: {},

  initialize: function () {
    new App.Routers.AppRouter();
    Backbone.history.start();
  }
};

Backbone.CompositeView = Backbone.View.extend({
  addSubview: function (selector, subview) {
    this.subviews(selector).push(subview);
    // Try to attach the subview. Render it as a convenience.
    this.attachSubview(selector, subview.render());
  },

  attachSubview: function (selector, subview) {
    this.$(selector).append(subview.$el);
    // Bind events in case `subview` has previously been removed from
    // DOM.
    subview.delegateEvents();
  },

  attachSubviews: function () {
    // I decided I didn't want a function that renders ALL the
    // subviews together. Instead, I think:
    //
    // * The user of CompositeView should explicitly render the
    //   subview themself when they build the subview object.
    // * The subview should listenTo relevant events and re-render
    //   itself.
    //
    // All that is necessary is "attaching" the subview `$el`s to the
    // relevant points in the parent CompositeView.

    var view = this;
    _(this.subviews()).each(function (subviews, selector) {
      view.$(selector).empty();
      _(subviews).each(function (subview) {
        view.attachSubview(selector, subview);
      });
    });
  },

  remove: function () {
    Backbone.View.prototype.remove.call(this);
    _(this.subviews()).each(function (subviews) {
      _(subviews).each(function (subview) { subview.remove(); });
    });
  },

  removeSubview: function (selector, subview) {
    subview.remove();

    var subviews = this.subviews(selector);
    subviews.splice(subviews.indexOf(subview), 1);
  },

  subviews: function (selector) {
    // Map of selectors to subviews that live inside that selector.
    // Optionally pass a selector and I'll initialize/return an array
    // of subviews for the sel.
    this._subviews = this._subviews || {};

    if (!selector) {
      return this._subviews;
    } else {
      this._subviews[selector] = this._subviews[selector] || [];
      return this._subviews[selector];
    }
  }
});

Backbone.TableView = Backbone.CompositeView.extend({
  rowSubviewClass: null,

  events: {
    "click th": "resort"
  },

  initialize: function (options) {
    this.sortCol = null;
    this.listenTo(this.collection, "add", this.addRowSubview);
    this.collection.each(this.addRowSubview.bind(this));
  },

  addRowSubview: function (model) {
    this.addSubview(
      "tbody", new this.rowSubviewClass({ model: model })
    );
  },

  resort: function (event) {
    var sortCol = $(event.currentTarget).data("sort-col");
    if (sortCol) {
      this.sortFn = this._sortColFn(sortCol);
    } else {
      var sortFnName = $(event.currentTarget).data("sort-fn");
      this.sortFn = this[sortFnName];
    }

    this.subviews("tbody").sort(this.sortFn);
    this.attachSubviews();
  },

  _sortColFn: function (sortCol) {
    return function (view1, view2) {
      var val1 = view1.model.get(sortCol);
      var val2 = view2.model.get(sortCol);
      if (val1 < val2) return -1;
      if (val1 > val2) return 1;
      return 0;
    };
  }
});

$(App.initialize);
