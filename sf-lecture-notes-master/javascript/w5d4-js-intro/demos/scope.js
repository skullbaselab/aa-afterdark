function blockScope() {
  let x = new String("ima string");

  if (true) {
    let x = "x var";
    const y = 'y variable';
    console.log(x);
    console.log(y);
  }

  x += "new string stuff ";
  let y = 'new y variable';
  console.log(x);
  console.log(y);
}

// console.log(x);
// console.log(y);

blockScope();

// node-debug scope.js
