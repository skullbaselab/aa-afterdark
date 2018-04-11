## Stack Class
---
+ Talk broadly about the functionality that a Stack should have. Emphasize that it should function *only* in the way we define it
+ Implement skeleton for a Stack class. Have students fill in each method (they should all be one-liners). This should be easy as they do it for homework the previous night
+ Take a back seat while they fill in each method (`initialize`, `push`, `pop`, `peek`, `size`)
  + For `initialize`, make sure you call the underlying array structure something *other* than `@stack` (`@elements`, for example). This avoids confusion.
  + Use an `attr_reader` for the underlying data structure. Say you're doing this because it is better to call readers inside of a class as opposed to instance variables
    + If they ask why, write a method that reassigns `@elaments` spelled with a typo. Does it throw an error, or fail silently?
+ Allow them to take the naive approach to filling in these methods. Gauge the room, ask if our Stack functions only the way we want it to. Test it in pry. 
+ Aha! Point out how we expose our array with the reader. Even though we can't reassign a reader, we *can* mutate it permanantly. For example, we can chain onto it, and call `reverse!`.
  + Fix this by making hte `attr_reader` private (Make sure to take the self off of any calls!). 
`Stack#push`, for example, returns our array. 
  + Fix this by returning self from our `push` method
+ Once again, test our improved version of the stack in pry. Ask the class, is it safe?
  + No! Our `Stack#push` method returns our array. We're exposed!
    + Fix this by returning `self` from `push`
 + Ok. Is it safe yet? Kind of. Notice how, while we can't *mutate* it, we can *look* at the whole stack. **Based on *our* ADT, this is not desired**
    + **Solution:** Override the inspect method by writing your own:
    ```ruby
        def inspect
          "#<Stack:#{self.object_id}>"
        end
     ```
  + Awesome! Now we have a functional *and* protected Stack implementation :)

## Queue Class
---
> **Note:** The class `Queue` already exists in Ruby. Make sure you call it something else to avoid confusion.

+ Go over our Queue ADT
+ This one can be much quicker than our stack class. Most logic is the same.
+ Make a note that, for *our* Queue ADT, we want the user to be able to view, but not modify, the whole queue.
+ **Methods:** `initialize`, `enqueue(el)`, `dequeue`, `show`
+ Try to take the naive approach again. This time, they should quickly suggest making the `attr_reader` private, and returning `self` in the `Queue#enqueue`
+ How can we handle the show method?
  ```ruby
     def show
       elements.dup
     end
   ```

## Node Class
---
+ Go over Node ADT. 
+ Do a very basic implementation. Initialize with just a `@value` and `@children`
  + If asked, tell them we are leaving off the `@parent` for simplicity
  + Make a public `attr_reader` for `:children` and `:value`. **Note:** We are just making it public for testability
+ It could look something like this:
```ruby
   class Node 
      attr_reader :value, :children
      
      def initialize(value, children = [])
        @children = children
        @value = value
      end 
    end
  ```
+ Load this up in pry. Make a `Node` instance with children
+ Demo how, just by having a root node, we can access all of the `children`. (i.e. `my_node.children.first.children.first`)
+ This is obviously inelegant and impractical! Use this to segueue into DFS/ BFS
    
