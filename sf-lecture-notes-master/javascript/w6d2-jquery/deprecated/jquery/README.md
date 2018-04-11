# jQuery

[What if I told you][morpheus] I could write a single line of code that
would show Reddit for what it truly is?

[morpheus]: http://generator-meme.com/inc/media/memes/what-if-i-told-you.jpg

```js
$("img").attr("src", "http://placekitten.com.s3.amazonaws.com/homepage-samples/200/287.jpg");
```

That is the power of jQuery.

## DOM (Document Object Model)

- The browser exposes an object, `document`, that allows JS to do cool
  stuff.

- Tree structure: nodes, parents, children
- Natively supported by browsers; however, support is not always
  standard and tends to provide minimal function.
  - Standardization is improving (thanks to disappearance of old IE,
    mostly).
- Native functions live on the `document` object (not to be confused
  with the global `window` namespace).
- Libraries to standardize and abstract across implementations are
  common; jQuery currently dominates.
- In addition to this standardized API, jQuery provides a very, very
  convenient syntax (`$`) and some cool helper methods `$.extend`,
  `$.ajax`.
- That said, [you don't always need jQuery](youmightnotneedjquery.com).
  It's still good to know how to do DOM manipulation in vanilla JS, as
  it sometimes comes up in interviews.

## jQuery

- For today: focus on manipulating DOM elements, especially toggling
  classes
- Core method: `$(selector)`: returns a jQuery collection of the DOM
  elements that match `selector`; `selector` can be any valid CSS
  selector (or combination of selectors).
  - Other useful methods:
    - `html` (sets inner html)
    - `append` (appends html)
    - `addClass`, `removeClass`, `toggleClass` (updates CSS classes)
    - `attr(attrName, attrValue)` (updates html attributes)
    - `text` (sets inner text)
    - `children` (finds direct descendants)
    - `find` (searches a tree; if called on a jQuery object, treats that
      node as the root)
- `$('<tagName>')`: creates a new tag in memory and returns it in a
  collection; you must insert it into the DOM
- NB: `$('li')` and `$('<li>')` do completely different things; be
  careful!
- jQuery methods tend to be well-behaved and save effort and danger of
  writing HTML by hand; prefer chaining jQuery to writing out HTML
  strings in most situations.
- In general: jQuery methods that **change** attributes will apply to
  all elements in the collection, while those that **read** attributes
  will take the first value.

## Snake and Towers

- Two approaches: create/destroy/move DOM elements or change properties
  of fixed elements
- In order of preference: change > move > create/destroy
- Two approaches to changing properties: in-line styling and class-based
- Classes are preferred: keep code encapsulated (by keeping properties
  in CSS), requires less work from jQuery and the browser
  - in-line can be useful in a few situations: mainly temporary
    one-element positioning
- Not that big a deal for Hanoi, but Snake will stutter if done
  inefficiently
- Key methods: `$.fn.addClass` and `$.fn.removeClass` add and remove
  classes
  - `$.fn.toggleClass` is tempting but may introduce subtle sequencing
    bugs; best to avoid unless you explicitly want sequencing dependence
