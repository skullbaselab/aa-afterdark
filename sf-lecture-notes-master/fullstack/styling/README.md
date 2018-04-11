# Full-Stack Style Examples

This document is intended to make clear what constitutes "satisfactorily styled",
and to provide specific tips for common full-stack failings.

## What Makes a Good Style

### Affordance

A lot of things go into making something look and feel good.

The most important question for UX design: **does everything do what it looks
like it should do?** In other words, do UI elements have the
[appropriate affordance](http://www.webdesignerdepot.com/2015/04/6-types-of-digital-affordance-that-impact-your-ux/)? An element that looks like a button should act like a button; I
should be able to click it to affect the state of something. Likewise, an element
that doesn't do anything on click should not be styled like a button (or it
should be grayed out).

### Layout

Unless they are a really strong student, they should be copying the layout from
the site they are cloning or another similar site. At the very least, they
need to follow **layout conventions**. Navigation at the top or left side, etc.
If you can't find an element on their page, it's probably because they aren't
following convention.

**Style protip**: Students need to add margin and/or padding to most block
elements (divs, buttons, etc.). This is one of the most common offenders of bad
looking sites, because everything looks and feels cramped.

![Cramped layout](http://i.imgur.com/ebsjyns.png)

![Roomy layout](http://i.imgur.com/BjqAcYJ.png)

Common elements that students don't pad: buttons, navigation links, text fields,
content divs.

Additionally, elements that are intended to be centered need to actually be
centered, both horizontally and vertically. One common example of this is in
top navigation bars--students often do not vertically center their navigation
links.

### Fonts

Most content should be sans-serif. Exceptions can be article or long-form
content, which is fine as serif.

No default fonts--no Arial, no Times New Roman (serif && default), etc.

Good source of fonts: [Google fonts](https://www.google.com/fonts)

Font also needs to be easy to read. Tend towards larger and/or higher contrast.

## Examples

### Unsatisfactorily Styled

[Spumblr](http://www.spumblr.willcreager.com/)

Specific notes: Titles randomly hop all over the place or pulse. The login
screens look mostly unstyled, and sit flush with the left side of the window.
Things are animated for no reason. Text is very difficult to read (black on
transparent gray, low size). Content divs have no padding. Etc.

### Satisfactorily Styled

[Pax Americana](http://paxamericana.herokuapp.com/)

Styling is light, but uncluttered. The text is long-form and intended to replicate
the look of books, so the serif font works. Headers are clean, elements are
where one would expect them to be.

Still, this is not an example of excellent styling. There are little errors in
padding and borders that show a lack of detail work. The form for signing in is
almost entirely default styling. When hovering over links, the cursor is the wrong
shape (links will always want to have a pointer cursor). It's a little unclear
what the functionality of the site is--you have to stumble across it.

### Excellently Styled

[Noisecave](http://lit-thicket-63459.herokuapp.com/)

Attention to detail. Good use of colors. Animations are used sparingly but
effectively. The styling serves to direct the user experience. Etc.
