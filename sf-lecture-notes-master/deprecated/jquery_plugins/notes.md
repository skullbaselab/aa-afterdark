# JQuery Plugins

### Event Delegation
* attach to parent element, then only trigger event for intended ancestor
* `currentTarget` - el that event was registered on
* `target` - el that triggered event
* `$('ul').on('click', 'li', function...` with jQuery
* `delegateTarget` is will be what the event was registered on originally
* `currentTarget` is usually what we want, jQuery sets this for us when we
   delegate

### Triggering
* `$(form).trigger('submit')` triggers a submit
* can trigger any js event

### Jquery Plugin Guide
* all jQuery methods(`addClass`, `css`) are plugins
* there are many plugins, because they are wicked easy to make
* unoptimized code that indicates poor knowledge of `jQuery`
* a plugin is created when you would perform the same series of
  operations throughout your code
* all `jQuery` functions live in `$.fn` object

```javascript
$.fn.greenify = function() {
    this.css( "color", "green" );
    return this;//should be able to chain
};

$( "a" ).greenify(); // Makes all the links green.
```

* use `this` inside because `this` is the `$` object
* return `this` so you can chain
* other libraries like to use `$` so we can define on `jQuery.fn`
  instead
* define it in an IIFE so we can have private vars and methods
* don't put extra crap into $.fn, it gets crowded in there
* we can also iterate over the collection using `$.fn.each`, `this`
  inside callback will be the `html element` so we might need to rewrap


# Important Points
* how to make a jQuery plugin
* css transitions
* event delegation
