# CSS
Cascading Style Sheets
A series of rules for how your html elements should appear on the page.

Figuring out your css is more experimental than writing code. There's no
substitute for messing around with it and seeing what you get. There are
tons of gotchas (too many to go over in lecture); remember, google is your
friend.

New York made a great cheat sheet. [Use this link](https://github.com/appacademy/css-demos#brief-notes)

## order of topics
- specificity
- box-model
- position (and document flow)
- display
- float (allows wrapping)
- clearfix
- debugging using chrome dev tools

## specificity
The levels of specificity are as follows (listed from least to most specific):

0. Universal selectors (\*)
1. Tag selectors (e.g. `div`, `h1`, `body`) and pseudo-elements (`:after`)
2. Class selectors (e.g. `.hidden`, `.my-class`) 
3. ID selectors (e.g. `#canvas`, `#container`)
4. Inline styles (`style="color: red;"`)

Specificity level is used to handle conflicts that arise in your css.
Each level of specificity is infinitely more specific than the previous level.
This means that a rule defined on an ID (`#main`) overrides any conflicting
rules defined on a class or a tag.

## position
Talk about the flow of the page.

- static (default)
  - this is how elements are positioned by default.
  - statically positioned elements sit in the flow of the document, they take
    up space, and other elements get displaced by their existence. This is why
    all your divs don't just sit on top of each other.
  - you can't modify the position of a static element by using `left`, `top`,
    `bottom`, or `right`
- relative
  - still occupies space in the flow of the page.
  - positioned relative to its normal position.
  - this means you can reposition it by using `left`, `top`, etc.
- fixed
  - fixed elements are positioned relative to the viewport. It will always
    appear in the exact same spot on your screen, no matter where you scroll.
  - fixed elements are taken out of flow (they take up no space in the page)
  - you can adjust their location on the page by using `left`, `top`, etc.
- absolute
  - this one gets weird. It's kind of like fixed, but not really.
  - instead of being positioned relative to the viewport, absolute elements 
    are positioned with respect to its most recent non-statically positioned
    ancestor. 
  - show an example.

## display
- block
  - element takes up space in the DOM.
  - block elements stack vertically; they don't stack side by side
- inline
  - object appears in line. no newline, no set width or height.
  - take up as little space as possible
- none
  - object does not exist. It takes up 0 space in the DOM
## clearfix
```
.clearfix:after {
  clear: both;
  content: "";
  display: block;
}
```

## best practices
1. Always be as unspecific as possible when deciding your css rules. Don't
define a rule on `div.my-class` when a rule on `.my-class` will suffice.
The more you overspecify, the harder it becomes to override.

2. Try and package your css styles in reusable classes. If you find that
you frequently need to hide various elements, you should make a `.hidden`
css class and add and remove this class from elements as is appropriate.

3. You should (almost) never use IDs for your css selectors. This is because
they are infinitely specific. This breaks the first rule; if you start 
using IDs, it becomes very difficult to override, making a sort of 
escalating arms race in selection specificity.

4. A corrolary to rule 3, **never** use in-line styles. They can't be overriden,
and now you have to look in two places to figure out where certain properties
are coming from, your css file and your html file. There is really only one 
exception to this, and that's if you're dynamically assigning styling 
as a part of your program.
