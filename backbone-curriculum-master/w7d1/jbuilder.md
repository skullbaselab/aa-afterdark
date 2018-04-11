# Jbuilder: Crafting JSON

## Serialization

JSON is a serialization format. A serialization format is basically a
way to represent data as a string. Serialized data is great because we
can easily send a string over the Internet. Then on the receiving end
that string can be parsed back into an actual data structure.

JSON is a popular serialization format. It is very important to us
because JSON will be used to get data from our Rails server to our
Backbone apps.

## JSON

There are only two data structures that JSON can represent at the "top
level", each of which is a type of key-value store: *arrays* and
*associative arrays*. Associative arrays are known as "hashes" in Ruby
and "objects" in JavaScript/JSON. The values in a JSON array or
associative array can be any of the primitive data types: strings,
numbers, booleans, and `null`. The values can also themselves be nested
arrays or associative arrays.

Here is an example of a JSON string:

```rb
"{\"fname\":\"David\"}"
```

The outer double quotes are not actually part of the string itself; they
just indicate that we are dealing with a **string representation of an
object**, and not a "live" object. Because the string itself contains
double quotes, the inner double quotes are all escaped. A simpler
representation using outer single quotes would look like this:

```rb
'{"fname":"David"}'
```

An even prettier notation might look like this:

```js
{
  "fname": "David"
}
```

Note that the outer quotations indicating that this is a string are not
being displayed in this format, but, remember, JSON is just a string.
Sometimes, though, for brevity, we will refer to a JSON string as if it
were simply an array or an object (hash).

## Jbuilder is a templating language

Jbuilder is a templating language maintained by the Rails folks that
allows us to craft complex JSON strings. Let's start looking at some
examples.

## Associative arrays

The following is a really simple Jbuilder template. It might live in a
file called `show.json.jbuilder`. The `.jbuilder` part means that this
file should be compiled with the Jbuilder templating library, and the
`.json` part means that the result will be a JSON string.

```rb
# app/views/api/users/show.json.jbuilder

json.fname 'David'
```

In a Jbuilder file, we are given a special object: `json`. By calling
methods on the `json` object, we can build up our JSON string. There are
a few built-in methods that we will call on the `json` builder object
(`extract!`, `array!`, and `partial!`), which we'll talk about shortly.
For now, you need to know that (via Ruby's `method_missing` method) any
*other* methods that you call on the `json` object will become keys in
the JSON string/object that we are building. The value will be the
argument that is passed to the method. So the above Jbuilder would
produce

```js
{
  "fname": "David"
}
```

In addition to strings, numbers are acceptable for values in a JSON
string.

```rb
json.age 27   # we could also write json.age(27) if we really wanted to
```

```js
{
  "age": 27
}
```

Booleans:

```rb
json.booleans_are_cool 5 == 2 + 3
```

```js
{
  "booleans_are_cool": true
}
```

We can pass complex expressions to the methods that we call on the
`json` object. Whatever the expression returns will be used as the value
at that key.

```rb
json.evens_sum [1, 2, 3, 4].select { |x| x.even? }.inject(:+)
```

```js
{
  "evens_sum": 6
}
```

You can set multiple key/value pairs:

```rb
json.key_one nil   # nil will be translated into null in JSON
json.key_two 'a string'
json.key_three Math.log10(1000)
```

```js
{
  "key_one": null,
  "key_two": "a string",
  "key_three": 3
}
```

Easy, right?

### Extracting attributes of an object

Suppose that we want to write a Jbuilder template to generate JSON that
will display some of the attributes of a User model. We might do
something like `@user = User.find(params[:id])` in our controller. We
will then have access to `@user` in our template. So we could do this:

```rb
# app/views/api/users/show.json.jbuilder

json.id @user.id
json.fname @user.fname
json.lname @user.lname
json.join_date @user.created_at
```

```js
{
  "id": 1,
  "fname": "Ned",
  "lname": "Ruggeri",
  "join_date": "2015-06-16T08:19:52.554Z"
}
```

That works, but it's a bit verbose. Instead, we can use the `extract!`
method -- as in, "I want to *extract* certain attribtues from this
object and add them to the JSON string that I'm building."

The first argument to `extract!` is the object from which to extract
information, and the remaining arguments are symbols that represent
methods that should be called upon that object. Each method name will
become a key in our JSON, and the return value of each method will
become the corresponding value.

```rb
json.extract! @user, :id, :fname, :lname, :created_at
```

```js
{
  "id": 1,
  "fname": "Ned",
  "lname": "Ruggeri",
  "created_at": "2015-06-16T08:19:52.554Z"
}
```

Notice that we are no longer aliasing `created_at` as `join_date`. If
doing so is important to us, we can simply mix and match our techniques:

```rb
json.extract! @user, :id, :fname, :lname
json.join_date @user.created_at
```

```js
{
  "id": 1,
  "fname": "Ned",
  "lname": "Ruggeri",
  "join_date": "2015-06-16T08:19:52.554Z"
}
```

## Arrays

So far, we have seen examples that use the Jbuilder DSL to build up a
JSON string that represents a single associative array, a.k.a.
JavaScript/JSON object. Now, let's look at the other data structure that
can be serialized at the "top-level" of a JSON string: an array. JSON
arrays are important because, in an index action, we want to send the
client a collection of objects. Another major use of JSON arrays is for
sending `has_many` associations to the client. For these purposes, we
can use `json.array!`.

In a controller action, we might say `@users = User.all`. Then in a
Jbuilder template, we could simply say:

```rb
# app/views/api/users/index.json.jbuilder

json.array! @users
```

It works! Well, sort of:

```js
[
  {
    "id": 1,
    "username": "ned",
    "password_digest": "$2a$10$cTzpF8svUgg5lkcqCpau2uP3Q2VKZmA9VZtzCr602CuMt9FNM9hhS",
    "session_token": "x3dca62G-Qn6Oe31UJHJ4w",
    "created_at": "2015-06-16T09:41:32.700Z",
    "updated_at": "2015-06-16T09:41:32.700Z",
    "fname": "Ned",
    "lname": "Ruggeri"
  },
  {
    "id": 2,
    "username": "kush",
    "password_digest": "$2a$10$f/QqE7DPjQz1y23QBBh7gOlEI3zXalKcyo4IU3Ndd4eHEtIoLnRUO",
    "session_token": "x3dca62G-Qn6Oe31UJHJ4w",
    "created_at": "2015-06-16T09:41:32.705Z",
    "updated_at": "2015-06-16T09:41:32.705Z",
    "fname": "Kush",
    "lname": "Patel"
  },
  {
    "id": 3,
    "username": "danny",
    "password_digest": "$2a$10$atSUTYltW5PNRS83RXl5i.dyzMJLyru3B3MDCATF0l1LS9SOftGcG",
    "session_token": "x3dca62G-Qn6Oe31UJHJ4w",
    "created_at": "2015-06-16T09:41:32.708Z",
    "updated_at": "2015-06-16T09:41:32.708Z",
    "fname": "Dan",
    "lname": "Marino"
  }
]
```

The problem is that we are sending too much data in our JSON. Revealing
some of these attributes poses a security threat. Other attributes
simply waste bandwidth.

We can take more control of how the individual elements in the array are
rendered by passing a block to `json.array!`. The first argument passed
to `array!` is still the `@users` collection that we want to serialize.
We also provide a block argument. Within that block, we can call methods
on the `json` object. Instead of affecting the "top level" JSON
string/array that we are building, within the block, the methods that we
call on the `json` object only define how each individual `user` is
rendered.

```rb
json.array! @users do |user|
  json.extract! user, :id, :fname, :lname
end
```

```js
[
  {
    "id": 1,
    "fname": "Ned",
    "lname": "Ruggeri"
  },
  {
    "id": 2,
    "fname": "Kush",
    "lname": "Patel"
  },
  {
    "id": 3,
    "fname": "Dan",
    "lname": "Marino"
  }
]
```

Ahh, that's better. Now we are only sending the information that we want
to send.

## Composing Jbuilder methods

That's pretty much the basics of what you need to know! We can combine
these techniques to build a JSON string that represents associations or
nested levels of information.

The following example shows how we can show a user's attributes along
with information about that user's dogs.

```rb
json.extract! @user, :id, :fname, :lname
json.dogs @user.dogs
```

Similar to our previous example, this will naively render all the
attributes of the user's dogs:

```js
{
  "id": 3,
  "fname": "Dan",
  "lname": "Marino",
  "dogs": [
    {
      "user_id": 3,
      "id": 4,
      "name": "Fang",
      "created_at": "2015-06-17T04:24:16.269Z",
      "updated_at": "2015-06-17T04:24:16.269Z",
      "breed": "Husky"
    },
    {
      "user_id": 3,
      "id": 5,
      "name": "Rover",
      "created_at": "2015-06-17T04:24:50.156Z",
      "updated_at": "2015-06-17T04:24:50.156Z",
      "breed": "Great Dane"
    }
  ]
}
```

However, we probably don't need the dogs' `created_at` and `updated_at`
attributes, for example. Let's use our Jbuilder skills to control how
the dog part of this JSON is rendered.

When we want to use Jbuilder methods in order to produce a value within
a larger JSON object, we can use a block argument. Before we look at the
template, though, let's think carefully about what we're trying to do:

* We are building up JSON that describes a user.
* We want to extract the user's basic attributes
* We also want to provide information about the dogs that the user owns.
  In other words, we want the user's JSON object to contain a `dogs` key
  that points to information about the dogs.
* We want to craft the value of the `dogs` key using additional Jbuilder
  methods, so we give `json.dogs` a block argument. The collection of
  the user's dogs will be represented as an array, which we accomplish
  via `json.array!`. Then, in the block argument of `array!`, we specify
  how each individual dog should be JSON-ified.

```rb
# app/views/api/users/show.json.jbuilder

json.extract! @user, :id, :fname, :lname
json.dogs do
  json.array! @user.dogs do |dog|
    json.extract! dog, :id, :name, :breed
  end
end
```

```js
{
  "id": 3,
  "fname": "Dan",
  "lname": "Marino",
  "dogs": [
    {
      "id": 2,
      "name": "Fang",
      "breed": "Husky"
    },
    {
      "id": 3,
      "name": "Rover",
      "breed": "Great Dane"
    }
  ]
}
```

## It's just Ruby

Jbuilder is a DSL (domain specific language), but it's ultimately just
Ruby. For example, we can still use `if-else` statements. This might be
useful for authorization purposes:

```rb
# app/views/api/users/show.json.jbuilder

json.extract! @user, :id, :email

if current_user.admin?
  json.shadowbanned @user.shadowbanned?
end
```

This would allow admins to see whether another user has been
shadowbanned.

When using partials (coming up next), we'll see that `if` statements
like this can also be helpful in determining whether to render a more
detailed part of the template (for a show view) or only the most
important information (for an index).

## Partials

Similar to `.html.erb` templates, we can use partials in Jbuilder. As
before, partial filenames must be prefaced with an underscore.

Partials can be used both in rendering a single object, or a collection
of objects.

A single model:

```rb
# app/views/api/dogs/show.json.jbuilder

json.extract! @dog, :id, :name, :breed
json.owner do
  json.partial! 'api/users/user', user: @dog.owner
end

# app/views/api/users/_user.json.jbuilder

json.extract! user, :id, :fname, :lname
```

```js
{
  "id": 5,
  "name": "Rover",
  "breed": "Great Dane",
  "owner": {
    "id": 3,
    "fname": "Dan",
    "lname": "Marino"
  }
}
```

A collection of models. This example uses partials two levels deep:

```rb
# app/views/api/posts/show.json.jbuilder

json.extract! @post, :id, :title, :body
json.comments do
  json.array! @post.comments do |comment|
    json.partial! 'api/comments/comment', comment: comment
  end
end

# app/views/api/comments/_comment.json.jbuilder

json.extract! comment, :id, :body
json.author do
  json.partial! 'api/users/user', user: comment.author, full_info: false
end

# app/views/api/users/_user.json.jbuilder

json.extract! user, :id, :fname, :lname

if full_info
  json.extract! :street_address, :city, :state, :zip
end
```

```js
{
  "id": 1,
  "title": "6 Things That'll Make You Click This Link",
  "body": "You won't believe it!",
  "comments": [
    {
      "id": 1,
      "body": "I'm such a sucker for clickbait!",
      "author": {
        "id": 3,
        "fname": "Dan",
        "lname": "Marino"
      }
    },
    {
      "id": 2,
      "body": "Me too!",
      "author": {
        "id": 5,
        "fname": "Harry",
        "lname": "Potter"
      }
    }
  ]
}
```

FYI, there are a few available syntax variations for calling on
partials, some of which are more succinct than the syntax shown here.
However, I think that this syntax is the clearest. You can check out the
docs below if you want learn about other possibilities.

## Resources

* [Official Jbuilder docs][jbuilder-docs]

[jbuilder-docs]: https://github.com/rails/jbuilder
