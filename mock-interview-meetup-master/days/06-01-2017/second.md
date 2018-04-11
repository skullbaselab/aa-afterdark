## Partner B interviews Partner A

### Block scope/Function scope (5-10 min)

**Describe the difference between function scope and block scope and how it relates to different variable types**


### Solution
Block scopes are different from function scopes in JavaScript. A function scope is created for every function (and we can nest them too):
```javascript
function iHaveScope() {
  // local function scope
  function iHaveNestedScope() {
    // nested local function scope
  }
}
```

We often identify those scopes as local scopes and identify the top-level scope as the global scope. In a browser environment, the global scope is controlled by the window object while in Node.js, it’s controlled by the global object.
It’s hard to completely avoid the global scope, unless you’re coding purely functional style, but you should minimize the use of any global variables because they represent a state and having that defined globally makes it more vulnerable to conflicts and data corruption. You should use an Immediately Invoked Function Expression (IIFE) - when you can - to wrap all your JavaScript code in a local function scope (in Node.js, this is actually done automatically for every module, so you don’t have to do it there):

```javascript
void function() {
  // your code here
}()
```

Block scopes are what you get when you use if statements, for statements, and the like. You can also use them stand-alone with a simple begin-end curly braces {}, not to be confused with empty object literals.

```javascript
var a = {} // empty object literal
{ var a } // undefined object in a block scope
if (3 == '3') {
  // block scope for the if statement
}
for (var i=0; i<10; i++) {
  // block scope for the for statement
}
```

#### var vs. let
The var keyword behaves differently in function scopes and block scopes. A variable declared with var in a function scope can’t be accessed outside that function scope.

```javascript
function iHaveScope() {
  var secret = 42;
}
secret; // ReferenceError: secret is not defined (in this scope)
```

A variable declared with var in a block scope is available outside of that block scope.

```javascript
for (var i=0; i<10; i++) {
  // block scope for the for statement
}
console.log(i) // => 10 (why oh why)
```

The i variable that we often use in a for loop will continue to exist beyond the scope of that loop, and that does not make since, really.
Luckily we now have a different way to declare variables, using let. Variables declared with let inside a block scope are only accessible inside that scope, making let the ideal solution to the for loop index variable scope problem. If we use let to declare the i variable in a for loop, that variable will only be available inside the for loop.

```javascript
for (let i=0; i<10; i++) {
  // block scope for the for statement
}
console.log(i) // ReferenceError: i is not defined (D'oh!)
```

#### const
Declaring a variable with const is exactly like let - when it comes to scopes - but creates a constant reference for the variable. We can’t change the value of a constant reference. If we put a primitive value in a constant, that value will be protected from getting changed:

```javascript
const PI = 3.141592653589793
PI = 42 // SyntaxError: "PI" is read-only
```

Note that if the constant is an object, we can still change the properties of that object, so be careful about that:

```javascript
const dessert = { type: 'pie' };
dessert.type = 'pudding'; // Sure thing
console.log(dessert.type) // pudding
We can’t however, reassign an object declared with const:
const dessert = { type: 'pie' };
dessert = { type: 'cake' }; // SyntaxError: "dessert" is read-only
```

### Add Two Numbers (30 min)

You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list in the same format.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8

342 + 465 = 807

Input: (2 -> 2 -> 2) + (8 -> 0 -> 4)
Output: 0 -> 3 -> 6

222 + 408 = 630

Do it iteratively!
THEN, do it recursively!


## Solution

* Make sure that the code accounts for numbers of varying length!

```javascript

 // * Definition for singly-linked list.
 // * function ListNode(val) {
 // *     this.val = val;
 // *     this.next = null;
 // * }


const addTwoNumbers = (l1, l2) => {
  let head = new ListNode();
  let curr = head;
  let num1 = 0;
  let power = 1;
  while (l1 !== null ) {
      num1 += l1.val * power;
      power *= 10;
      l1 = l1.next;
  }
  let num2 = 0;
  power = 1;
  while (l2 !== null ) {
      num2 += l2.val * power;
      power *= 10;
      l2 = l2.next;
  }
  let ans = num1 + num2;
  while (ans > 9) {
      curr.val = ans % 10;
      ans = parseInt(ans / 10);
      curr.next = new ListNode();
      curr = curr.next;
  }
  curr.val = ans % 10;
  return head;
};
```


### Recursive Solution
```javascript
const addTwoNumbers = (l1, l2) => {
    if(l1 === null) {return l2}
    if(l2 === null) {return l1}
    let sum = l1.val + l2.val;
    const l3 = new ListNode();
    l3.next = addTwoNumbers(l1.next, l2.next);
    if (sum <= 9) {
        l3.val = sum
    } else {
        l3.val = sum - 10;

        l3.next.val = 1 + l3.next.val;
    }
    return l3;
}
```
