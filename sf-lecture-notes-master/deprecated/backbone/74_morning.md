# W7D4

+ ZombieView
  + swapping router
  + collection view (with careful remove)
  + composite view

---

## Zombie View

When view is not properly removed, it is not garbage collected.

Demo!

---

## Swapping Routers

When the router swaps views in/out of $rootEl, it must cleanly remove the old
view.

```javascript
// app/assets/javascripts/routers/router.js
_swapView: function (newView) {
  if(!!this._currentView) {
     this._currentView.remove();
  }
  this._currentView = newView;
  this.$rootEl.html(newView.render().$el);
}
```

Where does this break down?

---

## Collection View II

When a parent view is removed, it must remove subviews.

+ store reference to subviews
+ override `View#remove`

---

## Composite View

When subviews are not the same and not directly rendered as a list.




---

#news reader
+ swapping router
+ getOrFetch
+ composite view concepts
  + array of subviews
  + when remove/leave is called iterate and call remove


---
*** DEPRECATED NOTES ***

# Bootstrap

## Links

* [Getting Started](http://getbootstrap.com/getting-started/)
* [Bootstrap
  Imports](https://github.com/twbs/bootstrap-sass/blob/master/assets/stylesheets/_bootstrap.scss)
* [Bootstrap
  Variables](https://github.com/twbs/bootstrap-sass/blob/master/assets/stylesheets/bootstrap/_variables.scss)
* [DEMO SNIPPETS](../by_topic/bootstrap_demo/snippets.md)

---

## Main Points

* Bootstrap is a *front-end framework*
* Gives you:
  * CSS resets and defaults styles (nice font, good margins)
  * CSS styles and widgets (alerts, buttons, dropdowns)
  * CSS grid system
  * Sass/Less source code for advanced usage
  * JavaScript/jQuery-powered widgets (modals, tabs, tooltips)
  * Vast customization abilities
* You should use it (or similar framework) because:
  * Includes an important baseline (Normalize.css, grid system, defaults)
  * Includes awesome widgets
  * Gives your app decent style from the get-go
    * *Employers and recruiters care about style*
* Only go without Bootstrap/framework if you're really, really good at CSS

## Setup

* `gem 'bootstrap-sass'` or download manually to `vendor/assets/stylesheets`
* Rename `application.css` to `application.css.scss`
  * And add `@import "bootstrap";`
* Add `//= require bootstrap` to `application.js`

---

## Grid System:

* Supports four device sizes: xs, sm, md, lg
* When you set column widths for one size, all sizes smaller than it will go
  full width

---

## Demo Steps:

* Clone NewAuth demo (make sure to add stylesheet, JS, and csrf_meta to
  application.html.erb)
* Show initial lack of styling
* Do Bootstrap setup
* Add navbar
* Add user dropdown
* Style sign in form
* Generate `PagesController` with `home` action
* Fill out `home.html.erb`
* Add Contact modal
* Add colorful Bootstrap variable overrides
* Add additional styling

