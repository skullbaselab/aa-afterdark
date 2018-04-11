Function.prototype.myBind = function (context) {
  // Non-fat arrow way:
  // const origFunction = this;
  // debugger;
  // this return method is invoked Function Style!
  // return function(){
  //   debugger;
  //   return origFunction.call(context);
  // };

  // One line fat arrow functions return implicitly :)
  // In fat arrow functions, the 'this' on the inside,
  // is the 'this' on the outside.
  // => Automatically bound to the context of where it is defined
  return () => {
    return this.call(context);
  };


};


class Cat {

  constructor(name) {
    this.name = name;
  }

  meow() {
    return `${this.name} is meowing...`;
  }

}

const c = new Cat('Kitty');
c.meow.myBind({name: "Thelonious"})();
