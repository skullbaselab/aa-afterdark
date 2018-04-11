[June cohort:  Patrick](./previous_lectures/june2016)  
[Nov 2016 cohort:  Maurice](./previous_lectures/nov2016)  

## Solutions prep

**Expect questions on:**
+ curry
+ bindWithArgs

**Point out:**
+ Asteroid constructor function delegates all work to MovingObject contructors

## Lecture
This lecture helps emphasize big takeaways from the videos/readings. Suggestion: toggle properties in a HW assignment or quiz questions to demo the effects of each CSS property.

**1) Big takeaways**
+ Clearfix
  + Show how containers of floated elements have no height.
  + Fixed height is is the WRONG solution. Doesn't allow for future resizing of child elements.
  + Clearfix: ensures that these containers have content :D
+ Padding or Margin?
  + `<a>` tags
    + Put padding on `<a>` tag if you want bigger clickable area
    + have to change to `display: block` because anchor tags default to inline
  + Sibling elements
    + Margins collapse
    + Except if the siblings are floated!
  + `margin: auto`
    + Set a width
    + (width propery is only valid for `block` elements)
+ Be explicit
  + Use `>` if you only need to style direct descendants.
  + In general, default to using `>` and only eliminate it when you intentionally want to style ALL descendants.
