# Bitwise Operations

## Translation from numbers to bits

**Every place to the left that's not explicitly written is a zero.** 
We might write numbers as strings of 4 or 8 bits, but in computers, numbers are typically represented by either 32 or 16 bits.

+ 1 // 0001
+ 2 // 0010
+ 3 // 0011
+ 4 // 0100
+ 5 // 0101
+ 6 // 0110
+ 7 // 0111
+ 8 // 1000

...

+ 16 // ??
+ 32 // ??
+ 11 // ??
+ 23 // ??


## Operators

### NOT

```
a = 00010111
b = ~a
b // 11101000
```

### AND

```
a = 00010111
b = 10011001
c = a AND b
c // 00010001
```

### OR

```
a = 00010111
b = 10011001
c = a OR b
c // 10011111
```

### XOR

```
a = 00010111
b = 10011001
c = a XOR b
c // 10001110
```

+ Used when a more even number of 1s and 0s is desired.

### SHIFT (<< or >>)

+ There are several different types of shifts, but today we'll be talking about _arithmetic_ shifts

```
a = 00010111
b = a << 2
b // 01011100
c = b >> 1
c // 00101110
```

Shifting one space to the left multiplies a number by 2; shifting one space to the right divides it by 2.

## Problems

### BYO XOR

Given the commands you now know, write out your own XOR (not using XOR, of course). Spend 5 minutes on this before sharing answers.

### Find the outlier (v1)

Given an array of numbers in which every number appears twice except one (which appears only once), find the outlier in linear time.
Now find it in linear time and constant space.
(Hint: Use bitwise operators)

Example arrays: 
+ [1,2,1] // find the 2
+ [4,7,3,7,2,2,4] // find the 3

Solution: 
+ create one variable xor_total = 0
+ arr.each({ |num| xor_total ^= num })
+ after the each is done, xor_total = the extra number

### Find the outlier (v2)

Given an array of numbers in which every number appears three times except one (which appears only once), find the outlier in linear time.
Now find it in linear time and constant space.
(Hint: Use bitwise operators)

Example arrays: 
+ [1,2,1,1] // find the 2
+ [4,7,3,7,2,2,4,2,7,4] // find the 3

Solution: 
+ for every bit that a number could have (typically 16 or 32)
  + loop through arr, count how many numbers have that bit as a 1
+ bit_count % 3 will return either 1 or 0 for each bit
+ construct a number out of the 1 bits

### Multiplication using bitwise operators

Write a generalized multiplication method using bitwise operators that takes num1 and num2 and returns their product.

Example:
+ `bitwise_mult(3,4) // 12`
+ `bitwise_mult(6,8) // 48`

Solution:
+ declare a number c = 0 // this is the value of the product
+ while b > 0 // until b is 0
  + if b & 1 != 0 // if b ends in a 1
    + c = c + a // c += a (product of a and 1 is a)
  + a = a << 1 // multiply a by 2
  + b = b >> 1 // divide b by 2
+ return c

### Division using bitwise operators

Write a generalized division method using bitwise operators that takes num1 and num2 and returns their quotient.

Example:
+ `bitwise_divis(4,4) // 1`
+ `bitwise_divis(9,2) // 4.5`

Solution:
To implement division using bitwise operators, you would end up essentially recreating long division. 
You'd align the most significant digits of the divisor with those of the dividend, subtract the two of them, 
add the work that it took to line up those digits to the quotient, and repeat until the remainder is 0. 
It's actually not too terrible to reason about, since each place holds either a 1 or a 0:

```
1001 % 10 => 

 1001
-1000  // 1 << 2 added to quotient
=   1
   -1  // 1 >> 1 added to quotient
=   0

1001 % 10 = (1 << 2) + (1 >> 1) = 4.5
```

Additional Resources:
https://www.quora.com/How-do-I-divide-two-numbers-using-only-bit-operations-in-Java
http://stackoverflow.com/questions/5284898/implement-division-with-bit-wise-operator

## Additional Resources

+ [wikipedia](https://en.wikipedia.org/wiki/Bitwise_operation)
