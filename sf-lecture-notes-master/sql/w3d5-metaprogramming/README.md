# Metaprogramming

Programs programming programs

---

![TGIF](https://media.giphy.com/media/dbtDDSvWErdf2/giphy.gif)

---

#### Learning Goals

+ Know what metaprogramming is
+ Metaprogramming constructs

---

### Lecture Agenda

+ Today's Material
+ Quiz Solutions
+ Open Forum
  + Questions from Yesterday's Projects

---

# Metaprogramming

When programs program other programs  ?

Note: It sounds like a design technique for high level enterprise architects or a faddish buzzword from the marketing team. In fact is far from an abstract concept or marketing speak. Metaprogramming is a collection of down to earth pragmatic techniques that doesn't just sound cool, they are really cool. Here would be the time to make examples.

---
# Examples

1. Wrapper for external services
2. Create your own language (DSL)... RSPEC?
3. Aggressively remove duplicated code
4. Stretch and twist ruby to your own specific needs
---

## A better definition

When a program dynamically alters itself at runtime.

---

## Some background
* Interpreted vs. Compiled Languages
    - Interpreted (usually)
        + Ruby
        + Python
        + JavaScript
    - Compiled (usually)
        + C++
        + Java

* Metaprogramming is how a lot of "Ruby magic" works under the hood.
---
### Java Hello World
```java
class Hello {
  public static void main(String [] args){
    System.out.println("Hello World");
  }
}
```
Result 
```bash
$ javac hello.java
$ tree
├── Hello.class
└── hello.java
$ java Hello
Helloooo
```

---
![byte-code](https://i.imgur.com/a2Ka04f.png)
---

## Interpreted vs. Compiled

* Interpreted languages generally allow for more flexibility and "metaprogramming magic"
* Compiled languages are often faster and less ambiguous - fewer moving parts.



---

##  Language constructs
Think of your source code as a world of citizens: variables, classes, methods, procs, lambdas, etc., we will call these **language construct**.

---
##  Language constructs (contd.)
+ Compiled language == ghost town
+ Interpreted language == busy marketplace

Note: Think of your source code as a world of citizens: variables, classes, methods, procs, lambdas, etc., we will call these **language construct**.

In many compiled programming languages, these language constructs behave more like ghosts rather than fully fledged citizens, why? Because you can see them in your source code, but they disappear before the program runs. Compiled languages, pardon the expression, compile, the code and produce and output file, at that point in time, language constructs have lost their concreteness, they are just memory locations. You cant ask for instance methods, because at that point of time the class has just faded away, in languages like C++, runtime is an eerily quiet place, like a ghost town.

In languages like ruby, runtime is more like a busy marketplace, most language constructs are still there, buzzing, playing and hanging around. You can even ask the citizens about themselves, this is what we call introspection. That being said, C++ and Java also provides some degree of introspection., but in Java, the distinction between compile time and runtime is even fuzzier.
---

## Introspection
+ Introspection - the program can examine information about itself while it's running instead of just at compile time.
---
### Code demo

---

### Introspection

+ Examples of methods that use introspection:
  + `self`
  + `Object::class`
  + `BasicObject::superclass`
  + `Module#ancestors`
  + `Object#methods`
  + `Module::instance_methods`
  + `Object#is_a?`
    + `Object.kind_of?  ¯\_(ツ)_/¯`
+ In languages like C, variable and function names are lost when translated to machine code. 
	* Languages like C++ and Java provide minimal introspection (i.e. asking for a class name)


Note: 
```ruby
# debugger
class Human
  # debugger
  attr_reader :firstname, :lastname
  def initialize(firstname, lastname, age = 0)
    @firstname = firstname
    @lastname = lastname
    @age = age
  end

  def fullname
    # debugger
    "#{firstname} #{lastname}"
  end
  
  def age_1_yr
    @age += 1
  end
end

class Student < Human
  attr_reader :age
  def initialize(firstname, lastname, age, grade)
    super(firstname, lastname, age)
    @grade = grade
  end

  def move_to_next_grade
    @grade += @grade
  end
end
```
Code demo for introspection make sure to cover 
  + `self` set a debugger statement in a class and then in a instance method. 
  	+ only one object at a time can hold the role of self and more often than note this tends to be for a small period
	  + Explain the 3 selfs (main/class/student). 
    + Dont forget to mention receivers and dot notation.
  + `Object::class`
  + `BasicObject::superclass`,  go over the human class.superclass stuff until you get to nil, and then ask the students if they think there is a relationship between this and how the methods are being called.
  + Module#ancestors chain of ancestors
  + `Object#methods`, will return public and protected methods including anything accessible from the objs ancestors, if a parameter false is passed and array of public and private singleton methods will be returned not including methods in modules included in obj. singleton methods can be something like 
    ```ruby
    def obj.method_name
    end
    ```
    the above is a singleton method.
  + Module::instance_methods => if they want to know about how to get the class methods they can either use Object::singleton_methods or this crazy diabolical thing
  ```ruby
    class Dog
    class << self
      self.instance_methods(false)
    end
  end
  ```
  + `Object#is_a? or Object.kind_of?`

Ruby's nature as an interpreted language is precisely why it lends itself to metaprogramming. Everything is available at runtime and can always be changed - classes, instance variables, etc. 
---

### Evaluation like constructs

+ `eval` and friends
  + `Kernel#eval`
  + `Object#instance_eval`
  + `Module::class_eval`
    + `Module::module_eval ¯\_(ツ)_/¯` 
+ Use cases: executing code from a file, user input, etc.

Note: before jumping to the demo give a quick rundown of `evals`

Kernel#eval => receives a string of code and evaluates it as if it were code.
Module::class_eval
```ruby
[1] pry(main)> Dog.new
NameError: uninitialized constant Dog
        from: (pry):1:in `__pry__`
[2] pry(main)> eval('class Dog; end')
=> nil
[3] pry(main)> Dog.new
=> #<Dog:0x007fab19eb4f08>
[4] pry(main)>
```
now lets take the class_eval for a spin and create a method
`Dog.class_eval('def self.hello; end' )` this will create a class method.
```ruby
[4] pry(main)> Dog.class_eval('def bark; puts "Bark Bark!" end')
=> :bark
[5] pry(main)> Dog.new.bark
Bark Bark!
=> nil
[6] pry(main)>
```

Now thats all good and looks kind of useful, right?
However the previous examples dont really exemplify the power 
and real usage of these metaprogramming constructs.

We all are familiar with what `attr_reader attr_accessor attr_writer`
so why dont we go ahead and try to write or own using what we have learner so far.
---

#### Code Demo
+ attr_accessor_lite

Note: **Disclaimer:** You will be rolling your own attr accessors for todays project, be warned the implementation we will code will be super different than the one you will code today.

First thing to consider is that so far, the attr_accessor in our introspection file, are called at a class level, right?

```ruby
...
class Human
  # debugger
  attr_reader :fname, :lastname, :age
  ...
```

This means that we will need a class_eval.
The reason why i decided to go with the object class is because all classes will inherit from it, and it is behavior we want available to all classes.

```ruby
  Object.class_eval do
    def attribute_accessor_lite(*attribute_names)

    end
  end
```

Lets go back to our human and student classes and update the method, let see if this actually works the way we wanted to.

```ruby
class Human
  # debugger
  ## we are using our own custom attr_accessor_lite
  attribute_accessor_lite :fname, :lname, :age
```

Lets set a debugger inside our new class to see what are the arguments that are being passed on
```ruby
[7] pry(main)> attribute_names
=> [:fname, :lname, :age]
```

Perfect, the new thing that wee need to build now is the getter and setter method
something like this
```ruby
  def fname
    @fname
  end

  def fname=(new_val)
    @fname = new_val
  end
```

If we think about it the only thing we need to do is iterate over the attribute_names and interpolate the value of the attributes into a heredoc string, i know heredocs are weird, but bare with me, we will set a bunch of debuggers and we will step through it

```ruby
require 'byebug'
Object.class_eval do
  # debugger
  def attribute_accessor_lite(*attribute_names)
    # debugger
    attribute_names.each do |attribute_name|
      heredoc = <<-MAGIC_STRING
          def #{attribute_name}
              puts '\t --> generate getter'
              @#{attribute_name}
          end

          def #{attribute_name}=( new_value )
              puts '\t --> generated setter'
              @#{attribute_name} = new_value
          end
        MAGIC_STRING
        debugger ## we need the debugger here to see what is the actual string being created
        class_eval heredoc
    end
  end
end
```

Now its time to test our code, lets load introspection in pry and start creating instances and use their respective attr methods
```ruby
[1] pry(main)> load 'introspection.rb'
=> true
[2] pry(main)> me = Student.new(nil,nil,0,0)
=> #<Student:0x007fa014cdd258 @age=0, @firstname=nil, @grade=0, @lastname=nil>
[2] pry(main)> me.firstname = "andres"
         --> generated setter
=> "andres"
[4] pry(main)> me.firstname
         --> generate getter
=> "andres"
[4] pry(main)>
```

---

#### Pros & Cons

+ Pros
  + Flexibility
  + Must for certain products
+ Cons
  + Dont play well with syntax coloring
  + Difficult to read & modify
  + Syntax errors will not be reported until evaluated.
  + Malicious code injection ($SAFE)

Note: **Easter Egg** If they dont mention anything about security risks i as a con run the following
```ruby
eval('puts Dir.glob("*")')
```
$SAFE values 0 -> 2 are deprecated, they used to validate the access to hard disk. Current values are 0 or 1, all or nothing kind of thing, set the safe value to 1, you will notice that eval is no longer available and that a SecurityError is thrown.

We are not going to go deeply into it but make a quick pry experiment
```ruby
[1] pry(main)> $SAFE
=> 0
[2] pry(main)> eval ('puts "safe string"')
safe string
=> nil
[3] pry(main)> $SAFE = 1
=> 1
[4] pry(main)> eval ('puts "safe string"')
/Users/aalfarho/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/pry-0.11.3/lib/pry/history.rb:117:in `<<': Insecure operation - << (SecurityError)
```
We will not discuss this, this was just an easter egg.

There are a lot of things to dive deeper into security but most of them are completely out of the scope of this lecture so we will move one, show them the Object#tainted? when getting variables from gets.chomp if you think that would help, i think this is too much and will just confuse students.

---

### method_missing (Ghost Methods 👻)

+ Called whenever Ruby cannot find a method in the ancestors chain.
+ Syntax: `method_missing(name, *args) { code }`
+ Result: overwrites `BasicObject#method_missing` to dynamically handle certain method calls
  + have a conditional that will do something if the method name is what you expect
  + else call `super`

---

### Code Demo

#### Github Wrapper

Note: Lets assume the following scenario, we are all familiar with git, right?
The cool thing about github is that we can go and access a bunch of information about repos.
Lets visit `https://api.github.com/repos/rails/rails`
```json
  "id": 8514,
  "name": "rails",
  "full_name": "rails/rails",
  "owner": {
  "login": "rails",
  "id": 4223,
  "avatar_url": "https://avatars1.githubusercontent.com/u/4223?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/rails",
  "html_url": "https://github.com/rails",
  "followers_url": "https://api.github.com/users/rails/followers",
  "following_url": "https://api.github.com/users/rails/following{/other_user}",
  "gists_url": "https://api.github.com/users/rails/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/rails/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/rails/subscriptions",
  "organizations_url": "https://api.github.com/users/rails/orgs",
  "repos_url": "https://api.github.com/users/rails/repos",
  "events_url": "https://api.github.com/users/rails/events{/privacy}",
  "received_events_url": "https://api.github.com/users/rails/received_events",
  "type": "Organization",
  "site_admin": false
  },
  "private": false,
  "html_url": "https://github.com/rails/rails",
  "description": "Ruby on Rails",
  "fork": false,
  "url": "https://api.github.com/repos/rails/rails",
  "forks_url": "https://api.github.com/repos/rails/rails/forks",
  "keys_url": "https://api.github.com/rep
}
```
For the purpose of this demo we will simulate that the class GitWrapper somehow will be able to go to this url and transform whats on our browser into a hash.

And we are tasked with creating a _repo model_, this repo model should be able to run code like

```ruby
repo.description
repo.forks
repo.language
```

Basically we want our model to wrap around that big hash.

So long story short GitWrapper only returns a gigantic hash back as part of its class method `repo_meta`

For those of you, curious fellas out there, there is some commented out code that actually goes and performs this action, however this is out of the scope of the lecture and introducing new variables like faraday and github tokens is just way out of scope.

```ruby
require 'faraday'
require 'json'
class GitWrapper
  def self.repo_meta(owner = 'rails', repo_name = 'rails')
  ####################################
  ######### Hit GitHub API ###########
  ####################################
  # To fetch github api directly rather than hardcoded values uncomment the following code
  #   conn = Faraday.new(url: "https://api.github.com/repos/#{owner}/#{repo_name}") do |faraday|
  #     faraday.request  :url_encoded
  #     faraday.adapter  Faraday.default_adapter
  #   end
  #   ## You will need a github token to make this work.
  #   response = conn.get do |req|
  #     req.headers['Authorization'] = ENV['GITHUB_TOKEN']
  #   end
  #   JSON.parse(response.body)

  ####################################
  ### Use Static Hardcoded values ####
  ####################################
  #  Comment the next line if you want to try
  #  out githubs API
  REPO_HASH

  end

REPO_HASH = { bunch of data}
  
end
```

Now to the meat of our demo

Now for the code demo we will create a _RepoModel_  we will initialize an instance var called @data_source, which will be set to the value of GitWrapper.get_repo_meta(user, repo_name). 

```ruby
require_relative 'git_wrapper.rb'
require 'byebug'
class RepoModel
  def initialize
    @data_source = GitWrapper.repo_meta
  end
end
```

We will start explaining that in the end we would like to be able to do something like repo.forks/repo.private repo.stargazers etc. Show them the naive and not DRY approach of creating those methods by hand. 
```ruby
  def forks
    @data_source['forks']
  end
  
  def private
    @data_source['private']
  end
  
  def stargazers
    @data_source['stargazers_count']
  end
```

Do you see the repeating pattern here, this is a really simple example that illustrates the power of ruby if we know how to use it. The behavior is exactly the same always, it is just a different key that we use to check in the hash.

This is where ghost methods shine on, reason being that we can use the method_missing as a fallback mechanism to check our @data_source, if the key exists or produces any value we are good to go, (else we just call super and that will throw an exception. 
Our method missing is incomplete by design, we dont want to overload students with respond_to? type of stuff (just yet).

Lets begin by writing an empty method missing with a debugger and start invoking non-existing methods.
```ruby
  def method_missing(name, *args)
    debugger
  end
```

If you think about it name is the "name" is the actual key on the hash, so our only job is to key in 
```ruby
  def method_missing(name, *args)
    @data_source[name.to_s]
  end
```

Lets test it out, this works, but why?

Lets go over an example, repo.language
lets bring up the ancestors for easier visualization
```ruby
[27] pry(main)> RepoModel.ancestors
=> [RepoModel, Object,  PP::ObjectMixin, Kernel, BasicObject]
```
Whats going to happen is that ruby will try to look for a method called `language`, first on RepoModel if it doesn't exist, then it will move to Object, and then Kernel and so on and so forth, until it reaches BasicObject if BasicObject does not have that particular method, what we are going to end up doing is is going to call method_missing, now, because we overrode method missing, our super new cool method will be executed.

There will be a linter error about `respond_to_missing?` this is a hook method called by respond_to?, whenever the method is not defined, the result of that method is returned, so good practice tells us we should override `respond_to_missing?`. Check the example here (https://ruby-doc.org/core-2.5.0/BasicObject.html), we wont go into further detail.

As you can see using ruby's metaprogramming we were able to achieve a couple of really important things.

1.- Our code is incredibly DRY
2.- And probably the most important thing, we twisted ruby to make our incredibly simple model a really flexible class, because what would happen if github decides to update the result hash, if they add or remove attributes, our model will be resilient to it, because it will be able to adapt on the fly depending on the response that we get from github api.
---

### Dynamic Proxies & Methods
+ `Object#send`
+ `Module#define_method`

---

### send

+ Syntax: `<Object.send(<method name>, *args)`
+ Result: dynamically calls method on object
+ Method can be a String or Symbol
+ Method can also be private, even from outside the class definition

---

### define_method

+ Syntax: `Module#define_method(:name) { |*args| code }`
+ Result: defines instance method with given name, input and code
+ Known as a **macro**: method that defines other methods
+ Call within class scope
    - Similar principle used in `attr_accessor` and `belongs_to/has_many`

---
### Code Demo

#### Github Wrapper v2 (Dynamic Proxies)

Note: So if you think about it we are creating methods on our repo model that could be handled or should be handled by our wrapper, right? So lets dynamically define methods in our wrapper so our model can call them.

The first thing we are going to do create the method that will be responsible for generating the methods

```ruby
  def self.generate_methods(info_hash)
    info_hash.each do |key, _|
      define_method key.to_sym do
        info_hash[key]
      end
    end
  end
```

We are running it as a class method because `define_method` should be executed within the class scope.

Next thing to update will be calling this method from the newly created initialize method

```ruby
  def initialize
    self.class.generate_methods(REPO_HASH)
  end
```

And voila automagically we created methods for our wrapper, now its time to update our repo model.

we will update our @data_source to the following.
```ruby
  @wrapper = GitWrapper.new
```

and lastly just update the method missing a dynamic proxy with

```ruby
  def method_missing(name, *args)
    @wrapper.send name
  end
```

---

### Instance Variables

+ Syntax
  + `instance_variable_get(:@name)`
  + `instance_variable_set(:@name, value)`
+ Note
  + instance variables are for one instance of a class
  + Class instance variables are for the class, but are not inherited by descendants
  + Class variables `@@var`, are inherited from superclass

---

## Code Demo

### Lets take a look at that human and student class.

Note: So far we have been using `@` to create instance variables but we haven't yet explore class instance variables.

Reuse the Human and Student code to play around with the @.

First create a @human_var and instance and class getter. Demonstrate that this @human_var is not available from Student nor from inside the instance of human. Calling Student.human_var actually return nil, it does not break, because the method is inherited but not the class instance var.

Let's say that I want to know how many instances of a human I have floating around in my code at any time.
Let's create a @@counter and its super class reader method. Lets update the initialize to update this counter.

As you can see every single time we create a human or student (which is also a human) this type of variables are accessible from within every scope and through children. 
---

## Pros of Metaprogramming

* Powerful if you know what you're doing
* Get more done with less code
* Flexible

---

## Cons of Metaprogramming

* Dangerous if you don't know what you're doing
* Confusing, less readable

---

## The Takeaway

Don't use it unless you have to! (You usually don't)

---

# Quiz

[Quiz](https://github.com/appacademy/daily-quiz/blob/master/sql/w3d5.md)

---

##  Today's Projects

#### [CSS Flex Exercise](https://github.com/appacademy/curriculum/tree/master/html-css/micro-projects/flex)
#### Solo: [ActiveRecord Lite](https://github.com/appacademy/curriculum/tree/master/sql/projects/active_record_lite) 

---

![bye-corgi](https://media.giphy.com/media/Wj7lNjMNDxSmc/giphy.gif)

---

# Open Forum

---

## Yesterday's Projects

* [Movie Buff](https://github.com/appacademy/curriculum/tree/master/sql/projects/movie_buff)
* [Polls App](https://github.com/appacademy/curriculum/tree/master/sql/projects/polls_app)

Note:
There are a LOT of active record methods. You shouldn't be expected to know all of them. Be happy to take questions, but it's okay to direct students to the docs
