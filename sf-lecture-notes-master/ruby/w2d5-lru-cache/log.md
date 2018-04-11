# LRU Cache Lecture

## 02/23/2018

Lecturer: Ned Ruggeri
Scribe: Aaron Wayne

### Questions

+ Is it beneficial to have the items ordered in the `NestedArraySet`
  + Yes, it would gain the same advantages to the `ArraySet` when we
    sorted that. I didn't do it for this data structure, because in
    the future, we will make that irrelevant. Great question though.
+ Is there a reason why we use double the number of buckets?
  + It works fine if we use any constant factor. We don't want to
    only add one bucket, and we'll talk about 
+ Does it ever reduce in size if we remove things?
  + It normally doesn't happen, but you can tell HashMaps to resize.
    It wants to find the high water mark so it doesn't have to do
    needless resizing, larger or smaller. So it won't do it
    automatically.
+ Doesn't it take a long time to do that resize if it is huge?
  + Yes, but we will talk about that in a future slide
+ Would this be another example of amortization?
  + I don't think it would be naturally interpreted that way, but I can
    see where you're coming from with that question. 
+ I get amortization from a conceptual level, but there is still a
  moment where the program needs to take time to resize it before
  inserting it
+ These resizing is visible to the user, can we do it in the background?
  + Great question, but in reality this isn't a problem you will ever
    see. That's a great technique to solve problems like this though
+ Aren't there wasted buckets?
  + Yes, there can be at most be `n` unwasted buckets. This would be
    `O(n)`
+ What about the old array?
  + It will be garbage collected
+ Does it cost more time or space to create an array with elements
  than to make a new array
  + Yes, it will take you time to create the array and then `n` time
    to insert all the elements
+ Why does the first and last have to be nil elements?
  + The code is more complicated because of nil checking
+ In order for this to work, we need to store references in the map?
  + Yes, we can't use indices or we would have to change them all when
    something new is added.

## 12/15/2017

Lecturer: Ned Ruggeri
Scribe: Anastassia Bobokalonova

### Questions

* Is there a term to differentiate your first slide from your second?
  * Statically sized set vs. a proto-resized set, but it's not its own thing yet.
* Are there duplicates?
  * No, that's why when we insert a value, we have to check first before adding it.
* In the example, it looks like its sorted, cant you just find it?
  * We still have to go through each element. There is no internal organization of those buckets. The internal buckets are sorted in the order that we put them in.

This is linear time. What I'll show next is how to grow the number of buckets as we add more items.
* Why is the O not a theta?
  * It's true, it's big Theta (1) but I won't distinguish between lower bound, will show upper bound.

My rule will be not to have more items than buckets. I'll re-hash and increase the bucket numbers.
* To check number of items, are you checking empty on your buckets?
  * When you make a hashmap class, you'll have 2 primary instance variables: `@store` and `@num_items`. So when you insert or remove, you'll increment and decrement `@num_items` too.
* What problem are you exactly solving here?
  * I want to grow the number of buckets as I grow more items. Because I want to have O(1) insert time.
* The average bucket size is ..1 ?
  * You can choose this, the most sensible default is 1. You get to set this, it'll always be constant.
* If you keep adding more buckets, don't you have to keep rehashing? When do I do rehashing?
  * What I've done here is doubled the number of buckets. The rehashing is O(n). If every bucket requires a re-hashing, then I won't achieve O(1) time. So I'll explain now why doubling is a good choice.
* If your buckets are 1 size, does this sort the set for you?
  * No, it doesn't necessarily sort the set for you.
* The "30" is from creating the new buckets?
  * I'll explain it again. We should try to spread this cost more fairly: amortization (in finance and in computer science).
* To understand the big picture, this is brining it from O(n) to O(1)?
  * That is correct. This system will ensure that insert, remove and include, will all be O(1) on average, constant time, which is ideal.
* Can you define amortization?
  * When you pay a cost now, for benefit in the future. If you buy a car for $20,000, but it lasts 20 years... so its more like $1000/year.
    * So you're doing work now and getting benefits later?
      * Yes, it's in balance.
* So when you rehash it's linear?
  * That specific operation is O(n). But the amortized cost is O(1).
* Does this amortization not work if you have items than buckets?
  * It doesn't matter what you choose as your ratio between items and buckets. What matters is the exponential growth in the number of buckets.
* What happens when you remove items? Should we decrease the number of buckets?
  * We don't typically do that.
* Is that like defragmentation?
  * Something like that.
* What if you were only going to have 11 items?
  * That's true, you don't take advantage of the benefit. If you buy a car every 20 years but you die at age 90...

Moving on, I want to put stuff other than numbers into the set. Like strings for instance. Introduces Hashing
* Would two strings "hello" hash to the same things?
  * Yes. The string hello is like an array of letters. Each letter is like an ASCII character, basically an array of numbers.
* What if you hashed pointers?
  * In ruby, you never hash pointers, only objects.
* What is the time complexity of performing a hashing function?
  * We will assume it constant. It does have to look at each bit, there's a lot to go into here.

Linked Lists. This is a sequence, not a set. It's slow, it's linear time to look stuff up by index.
* You can't start from the finish index to find something?
  * If you kept track of a third thing, like number of items, then you could start at the end. But it wouldn't change the name of the game. It'd be a great optimization, but still n/2, so linear time.
* For insertion, even though its O(1) time complexity, don't you have to look at the whole thing so there's no duplicates?
  * This is a sequence data structure, not a set. If we want to prohibit duplicates, that would be duplicates.
* Why is it necessary to have start and finish?
  * The user interacts with the list object (which has the two instance variables), instead of the structure itself. Like when you interact with an Array. We need some references to start and finish.
* If you wanted to pass the linked list to some other part of your application?
  * You really only have to give reference to the List object. And the list object has reference to the links in the chain. In this example, there are 4 instances of the links, and 1 instance of the List class.
* Is it good habit to call it head and tail?
  * It's your choice. Don't call it start and end because end is a reserved keyword.

Let's talk about how to remove a link from the linked list.
* In what context do you have access to the middle of a linked list (to remove it)?
  * We'll see this in LRU Cache. For now, let's imagine that we have a reference to the link.

Hash Map
* Is the number of buckets arbitrary?
  * It was chosen so I wouldn't have to write a lot. A good choice to start is 16.

LRU Cache
Why a hash map? Well we have keys and values. This URL to this HTML content.
How to keep track of what's recently used? That's where the Linked List comes in.
The thing that were most recently used with be at the end of the list.
In the hash map, the values are going to be the references to the links in the list.
So to look up the item 'xyz', we hash it, get 2, look in the hashmap at the second bucket, now we have access to the link with the actual value.

* Can you jump there directly?
  * Yes, I'll show you how to store references and get to the object directly.
* So the value in the hashmap is not the value?
  * That's correct, it's a reference to the link object, which stores the actual value.
* So when we look up stuff, doesn't it have to change the order of the linked list?
  * That's correct, that's what we'll do next.
* Why would you want to remove the key from the Hash map?
  * The most common use of eject is if I reach the max cache size.
* When you set this up, can you eject from the other end?
  * Yeah, you can flip this 180, would have to switch around popping and shifting.
* How relevant is this? Will we be implementing this on the job?
