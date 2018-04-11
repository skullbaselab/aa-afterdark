# 1/3/2018

Lecturer: David, Scribe: Ryan

## CSS

+ If you didn't add a fallback font, what would happen? 
  + The browser would find your hardware's default
+ Is importing like requiring?
  + Yes, it is
+ Is the point of importing to make your code cleaner? 
  + Yes
+ Will the dev tools still treat them as separate files?
  + Originally, yes
  + No, I would not be surprised if they recognize different files 
+ Can the sibling selector select multiple siblings?
  + Yes
+ Does order matter for child and sibling selectors?
  + Yes
+ What does the ::before/::after pseudo element do?
  + It allows you to dynamically insert a pseudo element before/after another one
+ Is hover a pseudoelement or a pseudoselector? 
  + It's a pseudoselector 
+ How does ordering matter?
  + Yes, it does
  + Rule are applied by specitificy and then by order down the page
+ If block elements take up the full width, then what does changing the width do?
  + It will look like the width has changed, but nothing else will be allowed on the line
  + The display will be affected, but not the block property
+ Sometimes my inline block elements cannot fit on the same line, even when I am sure that they should 
  + (discussion of bizarre ways to solve this bizarre problem)
+ Why is the image distorted?
  + I do not know
+ Is it true that you cannot precisely control 
+ Shouldn't it have been two columns for a pseudoelement? 
  + Yes, it is a good practice 
+ So is it just floating over there or is it (inaudible)
  + It's just being displayed lower
+ So basically (inaudible)
  + Yes, it's floating, but be careful with that term, because it is not a display:float
+ Can it obsure elements that it is place on top of?
  + Yes
  

# 10/2/2017

Lecturer: Shamayel

## CSS

+ In the application.scss file, can we do this for one page rather than for your whole site?
  + Rails encourages us to use this for our whole site so that when it compiles and serves things up to the server it will do as it expects
+ What if you put an important tag on a class as well?
  + Let's try it! The class would overtake it because it is more specific
+ Should we avoid using important tags?
  + Absolutely, it is way too specific and would be extremely annoying to hunt down where it is and figuring out why it is overriding everything else you do from there on.
+ How do we see what overrides what?
  + The specificity guide will help us with that and if they both fall in the same category, the lower one will override it
+ Should we have universal styling at the top and then get more and more specific?
  + That's true to an extent. But, I like to style our file by item so they are easy to find and change. But, you'll get the hang of it and have your own style as you learn.
+ What happens when you have a bunch of things in the same section?
  + Shows an example where it's a section tag, a class, and an id. Explains that it picks the most specific thing to apply.
+ It looks like you can have multiple classes on the same HTML element, is that true?
  + Yeah, absolutely. Because we may want different classes to do different styling.
+ Can you do a range?
  + Not quite, but we can use 'n' in nth-of-type to select elements by a certain pattern, this is a great thing to play around with
+ If you wanted to reference the 'one and a half' div as well, what would we use?
  + We would probably just grab the class because at that point we would be including everything.
+ I don't understand why sometimes when I subtract padding and take into account margin it doesn't add up, it's too big.
  + I'd say that question is specific enough to where if you show me the example I could take a look afterwards in open forum.
+ Do margins collapse automatically?
  + Yes, it does. It's a built in property.
+ With inline-block elements, why doesn't the l hit the top of the element?
  + This is a browser setting, we can change it to see how it would look differently
+ Do they have margins because they aren't touching?
  + No, these are actually spaces in the HTML file (aka on different lines which puts a space between them)
+ What does a clearfix look like in code and does it look like a block right now?
  + It doesn't look like a block, because you can see here we aren't taking up 100% of the width. The clearfix is an 'after' sudo tag that pretends like there is a tiny tag that breaks to float (it's an element not on the page but effects the page because it is an empty string which doesn't take up space). The clear: both is super important, it means don't allow anything to float on me.
+ What happens if we give the content something?
  + Let's take a look: Now we can see the text show up
+ In the homework we used group, why are we using clearfix now?
  + This is just the group name, we can call it anything we'd like (i.e. magic)
+ Is this changing the element?
  + No, the after tag makes it go directly after this element
+ Why is the class name content clearfix and not just clearfix?
  + These are two different class names that style things differently
+ What happens when we make the screen smaller and what happens if we remove clearfix?  
  + In this case, nothing. Because the text dictates the height of the container, not the picture itself. (See next question, builds off of this)
+ If the amount of text were smaller what would happen?
  + Shows them => Overflows the content box
+ With clearfix, can we put this into a variable?
  + No, but we can put it in one of our application.css docs and apply it everywhere we need it
+ How does it know which is last? (in last-of-type)
  + It applies to the last sibling
+ Should we use our own css or bootstrap
  + Hit on the length of debugging in bootstrap and also the importance of being able to use your own styling, especially how much more impressive it is and how it shows mastery
+ Does the percentage take the margin into account?
  + Correct, because of the box-sizing
  + Explains what the box-sizing: border-box does and its importance
+ Don't list items stack automatically?
  + Not if we reset style
+ How do we reverse the list?
  + Just reverse direction, row or column
+ Don't some browsers not support flexbox?
  + Basically all browsers do now unless they are really old
+ Would it be bad to nest flexboxes?
  + Absolutely not. Shows example of when it would be helpful.
+ Does flexbox make any of the images responsive?
  + The positioning of them, yes, look here as I shrink. But, the size of the image, no it won't unless we use flex-wrap. Shows demo of this (lots of wows)

## Quiz

+ If we had the p span selector above the p it would be red?
  + Yep, because it comes after (lower) -> Confusion on this, going to talk at open forum

## Homework && Yesterday's project handled at Open Forum 

# 5/2/2017

Lecturer: Shamayel

## Yesterday's project

+ _crickets_

## Quiz

+ (Q2) ?? specificity ??
  + order (last > first), specificity (multiple selectors > singular
  selectors)
+ selection with `>`?
  + doesn't change the overall specificity
+ why wouldn't this create 20px of padding?
  + margins collapse onto each other - an element's margin can overlap
  with another element's margin
+ is there a rule of thumb for using inline-block vs. float: left?
  + they occasionally will work differently - in general use flexboxes,
  though
+ what are the precedence rules for pseudo-selectors?
  + they are considered tags

## CSS

+ couldn't you just have a class .purple instead of a $purple variable?
  + yes, but then you couldn't use that color in different ways (e.g.,
  color, background-color, box-shadow, &c.)
+ ??
  + change the file extension from .css -> .scss to use SCSS
+ can you make your rails to generate a .scss file by default?
  + not as far as i'm aware
+ ?? variables ??
  + variables get replaced by their values before the CSS gets
  evaluated
+ rails default is css?
  + yes.
+ so if we select an element by its tag, class, or id, that selection
will be more specific than * or selecting its parent?
  + yes.
+ ??
  + see previous answer.
+ what is nth-of-type(3n + 2)?
  + will pick every third thing, starting with the second
+ will first-child affect all descendants?
  + yes, unless they have overriding styles on them
+ how would you pick every other one, starting from the first?
  + :odd
+ percentage widths vs. fixed widths?
  + they both have good use cases. buttons, for example, should
  probably be fixed size, while larger page layouts should be more
  responsive
+ ??
  + if two margins are bumping up against each other, what if they're
  different sizes?
+ what is margin collapse?
  + when margins overlap each other
+ so... floats?
  + margins of floated elements don't collapse
+ why did increasing the margin shrink the element?
  + increasing the margin pushed the edges of that element farther away
  from the sides of the page
+ floating elements mixing with non-floating elements?
  + non-floating elements keep their margin rules
+ ??
  + the way pages are laid out, their rendering starts with the
  left-most edge, applies the left margin, the left padding, the width,
  &c.
+ ??
  + ??
+ should we use div and span tags, or not? you guys seem to use them
  + use semantic tags where it makes sense to and you can
+ how do you decide what tags to use where?
  + 1st: build a wireframe of the page, 2nd: refactor the page design
+ padding works for inline elements? does margin?
  + yes - inline elements can have left and right margins
+ ??
  + can restyle every element that matches a selector on the page in
  the chrome console
+ changing rules in chrome is the equivalent of...?
  + adding a style rule to an existing selector OR adding an inline
  style rule (if you're adding a rule to element.style)
+ ??
  + that one you can't save
+ better way to update css than copy-pasting?
  + you can save stylesheets from chrome
+ see changes without refreshing the page?
  + the `guard` and `live-reload` gems auto-refresh your page for you
  whenever you change a stylesheet
    + included in today's project
+ what does `clear` in .clearfix do?
  + sets width and height in both directions
+ so the empty string does something?
  + the :after pseudo-element adds an element, styled like this, as the
  last child of a given element
+ ??
  + the `clear: both` means that the floating elements above it do take
  up space in the DOM
+ what if you just say `clear: right` or `clear: left`?
  + then it will only make the elements floating left (or right) take
  up space in the DOM
+ so clear always goes below the floated elements?
  + yes.
+ ??
  + try `inline-block` instead of float on your own and see what
  changes
+ why is one floating right rather than left?
  + because i added a style to make it float right
+ why is one cat in a separate zone from the other cats?
  + because it's in a different section from the other cats
+ do class names have to be in a specific order?
  + no.
+ flexbox vs. float?
  + i prefer flexbox
+ flexbox vs. float?
  + flexbox is newer; older code bases will use float
+ what happens if you can't add a ?? over 50%?
  + the elements then sit on top of each other.
+ how precise do you have to be with decimals and pixels?
  + as precise as you need to be for it to look good
+ does width allow for margins?
  + no
+ ??
  + ??
+ ??
  + you have to take margins and borders into account
+ what makes ??
  + these elements have some small amount of padding
+ ??
  + percentages can get weird if the page gets very narrow - media
  queries can help you make a site that looks good both big and small
+ `[class*='col-']`?
  + allows me to write styles that apply to any class that starts with
  "col-" (e.g., `.col-1-2` and `.col-2-3`)
+ why not use margins for `[class*='col-']`?
  + margins would probably work as well
+ ??
  + the last style definition in the stylesheet will win out
+ how do you see the size of the window?
  + as you change the size of it, there is a popup in the top right
  corner telling you the size of the window
+ how do you use the ruler? (CMD-SHIFT-F4)
  + you can also use the box model diagram or the inspector tool (will
  show you the element's size in tiny letters)
+ justify-content vs. align-items?
  + align-items works on the main axis; justify-content works on the
  perpendicular axis
+ why is this not centered?
  + because i didn't set it to be centered yet. **centers**. there
+ ??
  + the most common flex- properties are flex-direction, flex-wrap,
  align-items, and justify-content
+ ??
  + yes.
+ what if you reverse the order of a flex container?
  + its contents then reverse in order
+ how do we make it wrap to the next line?
  + the flex-wrap property
+ why wouldn't you use flexbox?
  + you should pretty much always use it (unless you're using something
  newer and better, like css-grid)
+ are there browsers that don't support flex?
  + old IEs (check https://caniuse.com/#feat=flexbox)
+ how does parallax work?
  + not going to get into it right now, but you can do it with pure CSS
+ where should you put fixed HTML elements?
  + at the top level, probably
+ ??
  + `position: absolute` positions an element relative to its closest
  non-`static` ancestor
+ ??
  + it's potentially not even on the page (element is hidden right at
  the top of the page)
+ can you z-index on any type of element?
  + z-indexing places an element in 3D space; you can only set z-index
  on elements that have a `position` property set
+ does z-index affect floats?
  + i would guess it does
+ everything is statically positioned by default?
  + yes.
+ ??
  + dropdown container is absolute; it hold the list items

## Homework

+ ??
  + i can email it out or put it in the sf-lecture-notes repo
+ best practices for organizing CSS files?
  + personalize that process, or use your company's style guide
+ should you structure by specificity?
  + no, not really. organize by type or location on page

---

2/28/17
lecturer: Jenn


### Homework/Quiz Questions

0. Is there a best practice with the data associated with elements?
  + Data-attributes. Probably won't be relevant when React comes around
0. Why does article p take precedent over section?
  + Equal priority - the last executed line will take precedence

### Lecture Questions

0. Does the $ have any relationship to jQuery? (Sass)
  + I don't think so. You don't need to use jQuery to use the $
0. Do we have to require anything here? (Sass)
  + No, Rails will automatically include the necessary gem for you
0. Is it because the span (specificity) is nested inside of it?
  + Yes
0. Could !Important be used for debugging?
  + Yes
0. Is !important == not important?
  + :fire: IT IS IMPORTANT :fire:
0. Do you have to have the greater than sign there (for direct descendant)
  + You need it for a 'direct descendant,' not just all descendants
0. What does the `a + p` selector mean?
  + when an element `a` is adjacent to element `p`
0. `a ~ p`
  + All siblings of `p`
0. What does largest descendant mean?
  + the things that takes up the most space inside of an element
0. When do we actually use a span?
  + depends on the project, but often when we want things to line up next to each other
0. Where is the best place to put this clearfix class?
  + in the parent container
0. Can we just use a CSS template / bootstrap?
  + Yes, but don't do it. You can do it yourself! It may even take more time
  to debug a template than it would've to do it yourself.
0. For everything that has a width attribute, can we use percentages?
  + Yes.
0. What is first-of-type and last-of-type?
  + *Visual Demonstration*
0. How does flex affect the height?
  + Flex does some magic that aligns and distributes the face of the elements for you
0. Should we worry about cross-browser compatibility?
  + Nope - works for the most part
0. In the video, the presenter would display on the body - is there any reason you can't do that
  + Nope
0. How do you fix a flexbox element?
  + Fix the parent element
0. Is there a height > width function / attribute?
  + In Sass, yes. Otherwise no.
0. Can you get access to resolution / pixel density?
  + Not really sure.
0. Mobile first design?
  + Mobile view is the simplest version of the site, but don't design for mobile first
0. The longevity of desktops?
  + Will the average person use websites on desktop

### Notes

  + http://caniuse.com/#feat=flexbox (basically, only old versions of IE don't support flexbox)
  + https://facebook.github.io/yoga/sw (Checkout Yoga for use of flexbox in other platforms!)

---

10/18/2016
lecturer: Kevin McCall

## CSS Survey

- maybe breaking up the homework a little bit more evenly - so that the last night wasn't 4 hours.
- flex and media - a lot of it is looking at the solutions and not retaining the material.
- CSS warmup is a really good project, but maybe we could do flex in it.
- Maybe put the CSS warmup earlier in the CSS curriculum.
- Maybe put the lecture earlier.
- Wants to learn how CSS works.
- Flex and such would be really great to have before doing TTT and Hanoi.
- Could we have CSS demos on jFiddle or something so that we can mess around it.
- CSS solo day for memorization time.

---

## Quiz/Homework

- What happens when we reorder CSS with different precedence levels?
- Is there any specific way to know the order of precedence?
- Where does the `!important` flag go in the order of precedence?
- If you use `margin-top`, `margin-left` do they still collapse?
- Why does floating change things so dramatically.

---

### Questions
- Is there a easy way to vertically align something?
- You can only float blocks and inline-blocks?
- Give me a common element that is naturally a inline-block? **Nice Question Kevin**
- Are `:after` and `:before` pretty well supported by browsers?
- When styling containers are there general standards that we should be keeping in mind? --responsive web design
- How do hover and clicks work on mobile screens?
- Is pixel font size the same as point font size?
- Why can't we zoom on certain websites when mobile browsing? (sounds like meta tags)
- Why do we have and how do we make gutters when designing grids?
- Should or should we not be using bootstrap?
- Flexing headers - where did you tell flexbox that the image needs to be on the left side?
- How does padding and margin interact with flexbox spacing?
- Styling - how should we style/ what should we do when we are working on our full-stack project?
- When the readings say some CSS style options only work on certain browsers, what actually happens? -- vendor prefixes
- How do we look at what our website will look like in another browser?
- What level of importance do inline styles get?
- What if there are multiple levels of specificity when writing selectors?
- In SCSS, are nested selectors for all descendants?
- How should we go about inherited styles?
- What is the (z) index of positioned elements?
- Are they really called "hamburger" icons?
- Should we take into account the css prefixes?
---
## Flexbox
- Does changing your flex-direction always change the main-axis and sub-axis?
- Does it take the largest element and change everything around it?

---
## Demo Questions
- Should we always have a defined content region?
- Does `margin: 0 auto` work - does it center all of our containers?
---

8/16/2016
lecturer: Kevin McCall

Questions:
- How do I find what events I can listen for?
- Can we directly save from the source tab in chrome dev tools?
- What is the best way to organize my style sheets?
- What is the time tag?
- How widely adopted is the flex property and how safe should we feel using it?

Suggestions:
- Find a way to demo more and talk less. Felt like I was talking a lot about many topics but nobody was really listening. Better demos...
