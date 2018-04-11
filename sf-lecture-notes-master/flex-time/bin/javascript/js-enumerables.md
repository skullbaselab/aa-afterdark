# Enumerables Flex Time 

* Went through `myInject` from the generator 
* Answered a question about how you can't return out of a `forEach` and that typically when we are writing enumerables we use for loops for that reason 
* After inject it turned into questions about `myBind` because the `myBind` station was really full
  * I just walked through the solutions from Friday's class work 

* Solution here: 

```javascript
Array.prototype.myInject = function (callback){
  let acc = 0;
  this.forEach((el) => {
    acc = callback(acc, el);
  });
  return acc;
};
```

Example callback function and test case here: 

```JavaScript 
let cb7 = (acc, el) => {
  return acc + el;
};
console.log([1,2,3,4,5].myInject(cb7) === 15);
```