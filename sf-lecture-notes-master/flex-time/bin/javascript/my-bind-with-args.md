# myBind

```js
Function.prototype.myBind1 = function (ctx) {
    const fn = this;
    const bindArgs = Array.from(arguments).slice(1);
    return function _boundFn() {
        const callArgs = Array.from(arguments);
        return fn.apply(ctx, bindArgs.concat(callArgs));
    };
};

Function.prototype.myBind2 = function (ctx, ...bindArgs) {
    return (...callArgs) => this.apply(ctx, bindArgs.concat(callArgs));
};
```

* Walk through both versions of the function command-by command.
    - Be sure to cover why we only pass in `ctx` when using `arguments`, and also why we use `slice(1)`.
    - Explain why we use `fn` to represent `this` and why the fat arrow version allows us to simply use `this`
    - Explain why it's important to use function notation when using the `arguments` variable
    - Conversely, explain why you can only use `this` to `apply` the function when using fat arrow notation.

* Make sure to cover the alternative to `Array.from`, `Array.prototype.slice.call(arguments)`

* A simple example that might be useful is making a dog instance meow using a method from a Cat prototype.