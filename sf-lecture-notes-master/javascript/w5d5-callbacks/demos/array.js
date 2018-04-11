a = [10,46,115];

b = [1,2,3];

console.log('a', a);

console.log('b', b);

console.log(`b.push:`, b.push);

console.log(`b.push(4):`, b.push(4));

console.log(`b.push(4):`, b.push(4));

console.log(`a + b:`, a + b);

console.log(`a - b:`, a - b);

console.log(`a.concat(b):`, a.concat(b));

console.log(`a:`, a);

console.log(`a.concat(b).sort():`, a.concat(b).sort());

console.log(`a.concat(b).sort((a,b)=>a-b):`, a.concat(b).sort((a,b)=>a-b));
// ^ note the implicit return

console.log(`[] === []?`, [] === [])