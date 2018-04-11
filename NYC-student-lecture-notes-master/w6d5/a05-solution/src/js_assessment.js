function shuffledSentenceDetector (sentence1, sentence2) {
  const words1 = sentence1.split(' ');
  const words2 = sentence2.split(' ');
  if (words1.length !== words2.length) {
    return false;
  }
  words1.sort();
  words2.sort();
  for (let i = 0; i < words1.length; i++) {
    if (words1[i] !== words2[i]) {
      return false;
    }
  }
  return true;
}

Array.prototype.myEach = function (callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }

  return this;
};

Array.prototype.myMap = function (callback) {
  const result = [];
  this.myEach((el) => {
    result.push(callback(el));
  });
  return result;
};

function pairMatch (arr, callback) {
  const result = [];

  for (let i = 0; i < arr.length; i++) {
    for (let j = 0; j < arr.length; j++) {
      if (i === j) { continue; }
      if (callback(arr[i], arr[j])) { result.push([i, j]); }
    }
  }

  return result;
}

let defaultCallback = (num1, num2) => {
  if (num1 < num2) {
    return -1;
  } else if (num1 === num2) {
    return 0;
  } else {
    return 1;
  }
};

Array.prototype.bubbleSort = function (callback) {
  if (typeof callback !== "function") {
    callback = defaultCallback;
  }

  let resultArr = this.slice();
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (let i = 1, n = resultArr.length; i < n; i++) {
      if (callback(resultArr[i - 1], resultArr[i]) === 1) {
        sorted = false;
        let swap = resultArr[i - 1];
        resultArr[i - 1] = resultArr[i];
        resultArr[i] = swap;
      }
    }
  }
  return resultArr;
};

Function.prototype.myBind = function (context, ...bindArgs) {
  return (...callArgs) => {
    return this.apply(context, bindArgs.concat(callArgs));
  };
};

function inherits (Child, Parent) {
  const Surrogate = function() {};
  Surrogate.prototype = Parent.prototype;
  Child.prototype = new Surrogate();

  // This part is an unnecessary nice-to-have. `gizmo.constructor =>
  // Cat` is JavaScript's way of writing Ruby's `gizmo.class`. You
  // won't be tested on the constructor property.
  Child.prototype.constructor = Child;

  return Child;
}

function myCurry (fn, obj, numArgs) {
  const args = [];

  function curriedFn(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(obj, args);
    } else {
      return curriedFn;
    }
  }

  return curriedFn;
}

