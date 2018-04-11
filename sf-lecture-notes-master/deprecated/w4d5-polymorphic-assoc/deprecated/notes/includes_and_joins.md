# N + 1, includes, and joins
For this demo, use the rails project `includes_and_joins` in the same folder. Be sure to
seed the database to get useful data. When running the example, count the number of times the
database gets hit (sometimes you'll get a CACHE hit, but that still counts).

## Preventing N + 1 queries
N+1 queries occur when you iterate over an activeRecord relation and call methods
on each element which also query the database.

Example:
`Cat.all.map(&:owner)`

The database gets queried once for all the cats (1), and then once for every
`owner` method call (N). There are several ways to prevent this, the most
common of which are `includes` and `joins`.

## Includes (preload and eager_load)
`includes` is a tricky method. Its sole purpose is to choose whether a given
query should be `preload`ed or `eager_load`ed. Let's look at some examples to
better illustrate the difference.

#### Preload
In the simple case, `includes` chooses to `preload`; it fires 2 queries:
one to grab all the data from the original query (i.e. `Cat.all` in the above
example), and one to grab all the included data. The example below illustrates
this.

`Cat.all.map(&:owner)`
`Cat.preload(:owner).map(&:owner)`

You'll notice that in the second instance, there was one query to cats, but
then rails stored all the `id`s and used them to grab all the necessary users
in one query (using the SQL `IN` statement). This is the more common behavior
of `includes`. However, there are situations where this behavior is insufficient,
and that's where `eager_load` comes in.

#### Eager Load
Instead of executing a query for every included table, we can join them all into
one big query. This is what `eager_load` does.

`Cat.eager_load(:owner)`

Why is this useful? Let's imagine a scenario where we wanted to select only cats
whose owner was "ned". The simple `preload` fails us here because the cats query
is separate from the users query.

`Cat.preload(:owner).where(users: {name: 'ned'}) #=> error`
`Cat.eager_load(:owner).where(users: {name: 'ned'})`

#### Includes
Rather than trying to keep track of when to `preload` and when to `eager_load`,
it's way easier to just use `includes`. Includes defaults to `preload`, except
in situations where `preload` will fail. Then it `eager_load`s.

`Cat.includes(:owner).map(&:owner)`
`Cat.includes(:owner).where(users: {name: 'ned'})`

When in doubt, use `includes`.

## Joins
The other main tool for joining tables in ActiveRecord is `joins`. `joins`
differs from `includes` in that it doesn't automatically `SELECT` all
the fields from the tables you've joined. This means that it doesn't store data
on the model unless you explicitly tell it to. Example time.

`Cat.joins(:owner).map(&:owner) #=> N+1 query!`
`Cat.joins(:owner).select("cats.*, users.*").map(&:owner) #=> much better`

So why even bother? Well `joins` is useful because it doesn't store unnecessary
data. If you want to use an association for a condition, but you don't actually
want any data from it, `joins` is perfect. Let's look at the `eager_load`
example from above where we want the cats owned by "ned". We can accomplish
this better with `joins`.

`Cat.joins(:owner).where(users: {name: 'ned'})`

This version is preferable to the include/eager_load because it doesn't bother
selecting the user information when all we really wanted was the cats. The other
scenario where it's useful is for returning non-standard attributes from an
association. Check out the example below.

`Cat.joins(:user_likes).select("cats.*, COUNT(users.id) as like_count").group("cats.id").map(&:like_count)`

The example above joins cats on users through the `user_likes` association, but
only selects the `count` of the users who have liked this cat. And then just to
illustrate that it doesn't trigger an N+1 query, I mapped the like_counts to an
array.

## That's it!
That's all you need to get started with `joins` and `includes`. Try messing
around with the sample project we have for more practice!
