# Composite Views


### Zombie View
- if no model/collection listeners, then the view would be able to be garbage-collected


### Compositve View
- create subview
- push subview to this.subviews
- add subview
  - attachSubview
    - append subview to $el
    - subview.delegateEvents();
- re-render subview
  - empty $el
  - this.attachSubviews();
- remove composite view
  - the problem is that listener callbacks would hold onto the view even if we remove the view from the DOM.
  - call recursive remove in the composite view class

In other words, to remove subview you need to:
  - remove view listeners
  - remove view from subviews
  - remove view from DOM
