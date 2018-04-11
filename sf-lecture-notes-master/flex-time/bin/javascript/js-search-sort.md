# Search and Sort

## Merge Sort

* Merge sort was instantly the one brought up. Most of the questions were clarifying JS syntax rather than the logic behind it but there was also confusion about the callback. They were confused what a comparator would look like and how to call it / what to put in the conditional in the "merge" function.
* The code is provided below, starting with a sample callback, comparator

```JavaScript
let callbackExample = function (el1, el2) {
  if (el1 > el2) {
    return 1;
  } else {
    return -1;
  }
};

Array.prototype.myMergeSort = function (callback) {
  if (this.length <= 1) {
    return this;
  }

  if (!callback) {
    callback = callbackExample;
  }

  let midIdx = Math.floor(this.length / 2);
  let left = this.slice(0,midIdx);
  let right = this.slice(midIdx, this.length);
  // debugger
  return merge(left.myMergeSort(callback), right.myMergeSort(callback), callback);
};

let merge = function (left, right, callback) {
  let tempArr = [];
  // debugger
  while (left.length !== 0 && right.length !== 0) {
    if (callback(left[0], right[0]) === -1) {
      tempArr.push(left.shift());
    } else {
      tempArr.push(right.shift());
    }
  }
  tempArr = tempArr.concat(left).concat(right);
  return tempArr;
};
```

## Bsearch

* Bsearch was the next one they wanted to go over, the code is below
* The main emphasis was on midIdx + 1 because we don't want the midIdx included in either array as well as why we can't just return the rightIdx similarly to leftIdx (because we need to account for the indices to the left of the result)

```JavaScript
Array.prototype.myBsearch = function (target){
  if (target < 0) {
    return null;
  }

  if (this.length === 0) {
    return -1;
  }

  let midIdx = Math.floor(this.length / 2);
  let left = this.slice(0,midIdx);
  let right = this.slice(midIdx+1,this.length);

  if (this[midIdx] === target) {
    return midIdx;
  } else if (this[midIdx] > target) {
    return left.myBsearch(target);
  } else {
    let rightIdx = right.myBsearch(target);
    if (rightIdx === -1) {
      return rightIdx;
    } else {
      return (midIdx + rightIdx + 1);
    }
  }
};
```
