# Week 7 Day 4

### Zombie Views

- How to check if you have zombie views:
  - go to timeline tab in Chrome Dev Tools
  - record clicking
  - look memory usage
  - if the graph is going up, then you have zombie views
- Solution:
  - swap out router
  ```js
  _swapView: function (view) {
    if (this._currentView) {
      this._currentView.remove();
    }
    this._currentView = view;
    this.$rooRl.html(view.render().$el);
  }
  ```
  - keep track of all the children views so that you can remove them when you remove the parent view
  ```js
  remove: function () {
    this._subviews.forEach(function (view) {
      view.remove();
    })
    Backbone.View.prototype.remove.call(this);
  }
  ```
