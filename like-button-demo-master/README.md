# Backbone Like/Follow Button ([Live demo][live-demo])

[live-demo]: http://aa-likes-demo.herokuapp.com

Here we've built a simple Rails and Backbone app that lets you "Like" and
"Unlike" cat pictures. This readme will walk you through some of the important
parts of the code. Even though we've chosen to use "Likes" for this example,
many of the principles illustrated here could just as easily be used for
"Follows", "Subscriptions", "Upvotes", or other join objects.

To simplify things for the live demo, most auth features have been disabled, and
you'll be permanently logged in as "Markov".

## Rails Layer

### Like Model
If we're going to make part of our app "likable", then we're going to need some
way of representing those likes in our database. At a minimum, we're going to
need a join table with foreign keys for a `User` and the object being liked (in
our case, a `Photo`). If users can Like more than one class of objects in your
app, consider implementing likes [polymorphically][polymorphic-associations]
with a [concern][concerns].

[polymorphic-associations]: http://guides.rubyonrails.org/association_basics.html#polymorphic-associations
[concerns]: https://signalvnoise.com/posts/3372-put-chubby-models-on-a-diet-with-concerns

### Rendering Photos (Likables)
When we render JSON for a photo, we want to include the number of times it has
been liked. We can do this easily by pre-fetching the `likes` association:

```rb
# PhotosController#show
@photo = Photo.includes(:likes).find(params[:id])

# _photo.json.jbuilder
json.num_likes photo.likes.size
```

When we get to the Backbone layer, we'll also want to know if the photo has been
Liked by the `current_user`. This will allow us to set the button text ("Like"
vs "Unlike"). We could render this as a boolean (`is_liked`, say); but it would
be even more useful to render the `Like` itself, if it exists. This way, our
Backbone view can simply `save` or `destroy` the `Like` when we click it. Here's
a naive approach to finding this object:

```rb
# _photo.json.jbuilder
json.like photo.likes.find_by(user_id: current_user.id)
```

Unfortunately, this approach will query the database for each `Photo` being
rendered. As we know, database queries are expensive, so let's optimize. I've
chosen to build a hash mapping a photo's `id` to the `current_user`'s `Like` of
that photo, if it exists. You can check out the code in the
[PhotosController][photos-controller] and the [User model][user].

[photos-controller]: ./app/controllers/api/photos_controller.rb#L5
[user]: ./app/models/user.rb#L31

## Backbone Layer

### Likable Mixin

`Likable` is written as a mixin [here][likable-mixin], so any Backbone model can extend it. All
that's required is to specify a `likableOptions` object and call `parseLike`
inside of the model's `parse` method. This mixin will do most of our heavy
lifting for us; it gives us access to a `toggleLike` method that will either
save or destroy the model's associated `like()`, and update the model's
`num_likes` accordingly.

[likable-mixin]: ./app/assets/javascripts/util/likable.js

### LikeWidget View

Finally it's time to look at the [view][like-widget] and
[template][like-widget-template] for our button. I've attached it to the
`PhotosIndexItem` view as a subview. I've also made the button part of a larger
widget that displays the total number of likes. The code is pretty simple: on
`click` events, the view calls its model's `toggleLike` method. It renders on
`change` of `num_likes` (which should only happen on a `sync` or successful
save/destroy of `this.model.like()`). All this should ensure that the widget
accurately reflects the current state of
affairs.

[like-widget]: ./app/assets/javascripts/views/photos/photo_like_widget.js
[like-widget-template]: ./app/assets/templates/photos/like_widget.jst.ejs
