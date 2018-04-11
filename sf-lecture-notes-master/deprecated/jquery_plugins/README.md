# W6D4

---

## Overview
+ Questions from the Assessment
+ Questions from the Solutions
+ Event Delegation
+ CSS Transitions
+ jQuery Plugin
+ Cool Demo

---

# Questions from the Assessment

---

# Questions from the Solutions

---

## Event Delegation
+ `$('li.cat').on("click", func)` - registers events on every individual cat
+ cats added later will not have this click listener
+ `$('ul.cats').on("click", 'li.cats', func)` - listener is on parent
+ doesn't matter when cats are added, will always work

---

## CSS Transitions
+ can transition most properties, `background-color`, `transform`
+ can't transition display, so no `none` to `block`
+ `transition: transform 1s ease, background-color 1s;`

---

## jQuery Plugins
+ `$(selector).xxxx` - all `xxxx` are jQuery plugins!
+ a plugin is just a function added to jQuery namespace
+ jQuery designed to be extensible
+ same kind of tranformation/logic to DOM elements? Make a plugin!

---

## jQuery Plugin Tips
+ `this` inside the function is the selected jQuery wrapped object(s)
+ should return original object so we can chain
+ can `each` over `this` to get to each element in selected group
+ can receive options
+ provide public interface for default options, don't make them edit your code!

---



## Cool Demo
+ :)
