CSS

---

## Agenda

- CSS (60 min)

---

## What is CSS?

- Cascading Style Sheets
  - Cascading allows several style sheets to influence the presentation of a document.
  - CSS defines a priority scheme that resolves conflicts when different declarations try to set a value for the same element/property combination.
- Allows us to separate _content_ from _presentation_
---
## Do I need to know it?
- _yes_
- The more you know, the better. When needed, there's always Google.

Note:
- CSS questions later
-write specificity on board - Universal < Tag < Class < ID < Inline
---

## Intro to SCSS

- An extension of CSS

Note:
draw common base and components sass architecture on the board
- draw variables example

---
## Variables
```SCSS
$font-stack:    Helvetica, sans-serif;
$primary-color: #333;

body {
  font: 100% $font-stack;
  color: $primary-color;
}
```
---
## Nesting
```SCSS
nav {
  ul {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  li { display: inline-block; }

  a {
    display: block;
    padding: 6px 12px;
    text-decoration: none;
  }
}
```
---
## Importing Partials
```SCSS
// _reset.scss

html,
body,
ul,
ol {
  margin:  0;
  padding: 0;
}
```

---

```SCSS
// base.scss

@import 'reset';

body {
  font: 100% Helvetica, sans-serif;
  background-color: #efefef;
}
```
---



## Selectors

- Selectors are patterns used to select HTML elements.
```html
<section class="numbers">
    <p>paragraph</p>
    <div id="one">One
        <div id="one-and-a-half">One and a half</div>
    </div>
    <div id="two">Two</div>
    <div id="three">Three</div>
    <input type="submit">Submit button</input>
</section>
```
---
- `section.numbers`
- `div#one`
- `section *`
- `section, div`
- `section div`
- `section > div`
- `p + div`
- `p ~ div`
- `input[type=submit]`
- `input:hover`
---

## Specificity Hierarchy

- Inherited styles
- Universal styles
  `*`
- Elements and pseudo-elements
  - `h1` and `div::before`
- classes, attributes, and pseudo-classes
  - `h2.example`, `input[type="radio"]`, and `button:hover`
- IDs
  - `li#example`
- Inline styles
  - `<h1 style=“color: #fff;”>`
- The `!important` flag

---

## Specificity Tips!

- Make your selectors only as specific as they need to be!

- Avoid inline styling and the `!important` flag

- Combinators `+`, `>`, `~`, `' '` have no effect on specificity.

---


## Box Model

- The Box Model is the foundation of layout on the Web.
- All HTML elements can be considered boxes.
![box-model](http://codewithme.us/portland/main-curriculum/images/box-model.png)

---

## Display

- Display determines how a box behaves and is displayed.
- It is the most important CSS property for controlling layout.
- The default display value for most elements is `block` or `inline`.

---
## `display: block`
- Always starts on a new line
- Takes up the full width available
- Can have width and height set on it.
- Examples:
  - `<div>`
  - `<h1>` - `<h6>`
  - `<p>`
  - `<form>`
  - `<header>`
  - `<footer>`
  - `<section>`

---
## `display: inline`
- Does not start on a new line; it flows with the document's text
- Only takes up as much width as necessary.
- Width and height settings have no effect
- Padding, margin and border will update the position of surrounding text, but will not affect the position of surrounding block boxes.
- Examples:
  - `<span>`
  - `<a>`
  - `<img>`

---
## `display: inline-block`
- flows with surrounding text; does not start on a new line.
- It can be sized using width and height.
- Examples:
  - `<button>`
  - `<select>`

---

## `display: none`
- Commonly used with JavaScript to hide and show elements without deleting and recreating them.

Some elements, like `<script>`, use `display: none;` by default.

---

## `display: flex`

- Flexbox (_Flexible Box_) provides a more efficient way to lay out, align, and distribute space among items in a container.
- The main idea is to give the container the ability to alter its items' width, height, and order to best fill the available space
- This is especially helpful for making your app more responsive.
- A flex container expands items to fill available free space, or shrinks them to prevent overflow.
- It is _direction-agnostic_ as opposed to the regular layouts (block is vertically-based and inline is horizontally-based).
---

## flexbox rules (no pun intended)


- `flex-direction`: establishes the main-axis; defines the direction flex items are placed in the flex container.
- `flex-wrap`: By default, flex items will all try to fit onto one line. You can change that and allow the items to wrap as needed with this property.
- `justify-content`: Defines the alignment along the main axis.
- `align-items`: Defines the default behavior for how flex items are laid out along the cross axis.
---

## Float

- Specifies that an element should be placed along the left or right side of its container, allowing text and inline elements to wrap around it.
- The element is removed from the normal flow of the web page.

---

## Position

- Static
- Relative
- Absolute
- Fixed
- Sticky

---

## `position: static`

- Elements are positioned `static` by default
- Static positioned elements are not affected by the top, bottom, left, and right properties.

---

## `position: relative`

- Setting the top, right, bottom, and left properties of a relatively-positioned element will cause it to be adjusted away from its normal position.
- Other content will not be adjusted to fit into any gap left by the element.

---

## `position: fixed`

- An element with `position: fixed;` is positioned relative to the viewport; it always stays in the same place even if the page is scrolled.
- The top, right, bottom, and left properties are used to position the element.
- A fixed element does not leave a gap in the page where it would normally have been located.

---

## `position: absolute`

- An element with `position: absolute;` is positioned relative to the nearest positioned ancestor.

---
## Homework

- [CSS Warm Up](https://github.com/appacademy/curriculum/tree/master/html-css/projects/css_warm_up)

---

## Quiz

- [Solutions](https://github.com/appacademy/daily-quiz/blob/master/rails/w4d3.md)

---
