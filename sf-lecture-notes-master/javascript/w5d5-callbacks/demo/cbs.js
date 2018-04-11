for (var i = 0; i < 3; i++) {
  setTimeout(function() { console.log(i); }, 2000);
}

for (let i = 0; i < 3; i++) {
  setTimeout(() => console.log(i), 2000);
}
