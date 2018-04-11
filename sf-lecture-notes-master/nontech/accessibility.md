
# Accessibility on the Net

---

## What is accessibility?

+ maximizing the audience for your webapp
+ making sure you don't lock anyone out

---

## Groups to think about

  + people with disabilities
    + visual impairments
    + hearing impairments
    + mobility impairments
    + cognitive impairments
  + people on mobile devices
  + people with slow internet

---

## Designing for accessibility

N.B.: Most of these practices are just good design practices.

+ change your perspective to think about alternative ways of accessing your site
  + screen magnifiers
  + screen readers
  + keyboard navigation
+ make sure your content can be consumed many different ways

---

## Accessible HTML

+ Plain Old Semantic HTML (POSH)
+ header hierarchy
+ keyboard navigation (tab & focus)
+ use clear language
+ input labels
+ alt text on meaningful images
+ make sure links have text inside them

---

## Next-level Accessible HTML: WAI-ARIA

N.B.: These additions don't change a web page - they only change how screenreaders interact with it.

+ replicate and expand semantic HTML using roles 
	+ role="search", role="button"
+ allow screenreaders to respond to content updates 
	+ aria-live
+ explain element properties and states 
	+ aria-required="true", aria-disabled="true"
+ allow keyboard accessibility 
	+ tabindex

---

## Accessible CSS

+ use styling conventions
+ give users feedback when they interact with interactive elements
+ color choices (contrast, colorblindness collisions)
+ think about how you're hiding content
+ make sure your pages handle larger text and zooming

Note:
+ :hover styling (e.g., cursor: pointer for links)
+ :focus styling
  
+ screen readers don't read visibility: hidden or display: none
+ screen readers do read absolutely positioned content

---

## Accessible JavaScript

+ make sure mouse-specific events can also be triggered by the keyboard
  + hover, focus, & blur events
+ make sure the page works without JavaScript
  + https://www.wired.com/2015/11/i-turned-off-javascript-for-a-whole-week-and-it-was-glorious/

---

## Mobile Devices

+ responsive design
+ touch events
+ allowing zoom
+ minimize typing needed to input data

N.B.: this includes TVs and watches now, too!

Note:
+ page layouts
+ smaller images
+ small but high-resolution screens

+ appropriately sized links
+ menus

+ username / password vs. pin

---

## Tools

+ MDN's Learn Accessibility resources
+ walkthroughs of the accessibility process
+ Firefox's "No Style" mode
+ web accessibility evaluation tools
+ color contrast checkers

Note:
+ MDN's Learn Accessibility resources: https://developer.mozilla.org/en-US/docs/Learn/Accessibility
  + keyboard accessibility: http://mdn.github.io/learning-area/tools-testing/cross-browser-testing/accessibility/native-keyboard-accessibility.html
+ walkthroughs of the accessibility process: 
	+ http://substantial.com/blog/2014/07/22/how-i-audit-a-website-for-accessibility
	+ http://usabilitymatters.com/how-to-do-a-diy-web-accessibility-audit/
  + https://www.campussuite.com/how-to-conduct-a-school-website-accessibility-audit/
  + WCAG checklist: https://www.wuhcag.com/wcag-checklist/
  + Teach Access: https://teachaccess.github.io/tutorial/
+ Firefox's "No Style" mode
+ web accessibility evaluation tools: 
	+ http://wave.webaim.org/
	+ https://tenon.io/testNow.php
+ color contrast checkers: 
  + http://leaverou.github.io/contrast-ratio/

---

ty and 
# back to work
