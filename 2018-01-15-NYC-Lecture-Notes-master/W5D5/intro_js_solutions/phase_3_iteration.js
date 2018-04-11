// Array#bubbleSort
Array.prototype.bubbleSort = function () {
  // gives a shallow copy of the entire array.
  // slice always returns a new array, even without args.
  const copy = this.slice(0, this.length);

  let isSorted = false;

  while (!isSorted) {
    isSorted = true;

    for (let i = 0; i < (copy.length - 1); i++) {
      if (copy[i] > copy[i + 1]) {
        // a crafty bit of array destructuring to avoid a temp variable
        [copy[i], copy[i + 1]] = [copy[i + 1], copy[i]];
        isSorted = false;
      }
    }
  }

  return copy;
};

console.log([5, 3, 4, 2, 1].bubbleSort());

// String#substrings
String.prototype.substrings = function () {
  let substrings = [];

  for (let start = 0; start < this.length; start++) {
    for (let end = start + 1; end <= this.length; end++) {
      substrings.push(this.slice(start, end));
    }
  }

  return substrings;
};

console.log("abc".substrings());
