# W7D1

+ jbuilder
+ Backbone.Model
+ Backbone.Collection
+ url()

---

## jbuilder

the README.md is the _BEST_ resource!

* `partial!`
* `extract!`
* `array!`

---

## Backbone.Model

* `initialize`
* `get` & `escape`
* `parse`
* `set`
* `fetch`
* `isNew`
* `save`
* `toJSON`
* `url`

---

## Backbone.Collection

* `add`
* `fetch`
* `forEach`
* `get`
* `length`
* `toJSON`

---

## Associations

---
## url()

**Most Common**

+ Collection { url: '/widgets' }
+ Model { urlRoot: '/widgets' }

**Least Common**

**use case:** If the route for the model is singular i.e. `resource :profile`

+ Model { url: '/widget' }

---

# Content

## JS MVC
* JS Models take in POJO
* save the POJO to an attributes instance variable
* make get and set methods to access
* store your models in /models and put in app manifest
* StaticPages controller for hosting static pages
   * all we need to deliver is some html and js
* js View is similar to a rails Controller
   * on construction of views create empty div and save as $el
* js Template is similar to a rails View
* APP.initialize
  * fetches some collection
  * builds a view
  * puts the views rendered content on the page

* it is common to bootstrap the CURRENT_USER_ID
* install ejs gem
  * alows us to use ejs and name templates view.jst.ejs
  * to make asset pipeline compile jst we need to add ../templates to ap.js
* models have arrays of callbacks that views can hook/listen to to rerender


```javascript
var photo = new Photo(formData);
photo.save(function (justSavedPhoto) {
  // stuff I want to do once the photo successfully saves
});
```
