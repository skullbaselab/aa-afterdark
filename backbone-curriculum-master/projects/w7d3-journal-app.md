# Journal

Design a Journal App using Rails on the backend and Backbone on the frontend.
Try to do this without referring to the tutorial. Do the following to get
started:

* Add `gem 'backbone-on-rails'` to your Gemfile.
* Run `bundle install`
* Run `rails generate backbone:install --javascript`
* Remove the line `//= require turbolinks` from your `application.js` file

## Phase I: Build a `Post` model

* Build a `Post` rails model. Give it columns for title and body.
* **Don't worry about users or login right now**.
* Make a `Posts` controller too. It will handle our API communication.
* We will need to render one page of HTML. Let's create a separate
  controller to handle this. You can call it `RootController` or
  `StaticPagesController`. In your Rails routes, set the root page
  of the app to the controller's `root` action.
* Create a view for the `root` controller action. All it needs is an `<h1>`
  with the name of your app so that we know it's working. This will be the
  only page that rails will ever render i.e. the only time we won't
  `render :json => ...`. From here on out, Rails' only duty will be
  communicating with our Backbone javascript client side application using
  the API.
* Next, write a Backbone.Model called `Post`.
    * Set up the `urlRoot` property.
    * You don't need to give it any other attributes or methods, merely
      extending `Backbone.Model` will be enough because our api will
      exhibit default *restful* behavior and our model will not require
      any custom functionality.
* Next, write a Backbone.Collection named `Posts`. We need to give it just
  a couple small pieces of information so that it knows how to communicate
  with the server. By default, backbone collections trust that the api they
  are communicating with follows the default *restful* conventions. If this
  is true, merely giving them a `url` property pointing to the root of the
  resources, `posts` in our case, will be adequate. This is why Backbone.js
  is great! No more tedious AJAXing! Backbone can take care of all of that
  for us.
    * set the `model` property so the collection knows what kind of
      objects it contains.
    * set the `url` property so it knows where to fetch/post `Post`s.
    * write a `getOrFetch(id)` function. Note that, even though the
      function is called `getOrFetch`, we actually want to fetch no
      matter what, to make sure that we retrieve from the server the
      most up-to-date attributes of the post in question. The question
      is whether we can call `fetch` on a model that we simply retrieve
      from the posts collection, or whether we need to instantiate a new
      model with an `id` of `id`, and then fetch that model. If it's the
      latter, we should also add the post to our collection once it has
      been successfully fetched.
* Visit the rails view we created earlier. If we do not visit one of our
  own pages, Backbone will not be loaded. Did Backbone load? By default it
  should have popped up a message that says: 'hello from backbone'.
* Open up the javascript console on the chrome debugger. Type `Backbone`
  and press enter. Is it undefined? If so you might have skipped a step.
* Create a new instance of the collection we created. The constructor doesn't
  need any arguments. Call `create` on this instance, passing in a javascript
  object with a `title` and a `body`. If everything is working you should
  have a new `Post` created in your database! Thanks backbone! If it didn't
  work, perhaps you don't have a `create` action in your `PostsController`?

## Phase II: Build a `PostsIndex` view

* Build a `PostsIndex` view class.
* Create a template in the `assets/templates` folder. Assign it to the
  `template` property of the view. Now we can call `this.template()` and
  it will return the rendered template. Templates are nothing to fear.
  Calling `this.template` merely builds the html, just like rendering an
  `html.erb` in Rails! We can also pass in a javascript object as an argument
  to the call to `this.template`. The keys will be available as local
  variables during the render. Just like rendering a partial in rails!
   * Remember that you don't want to put semicolons inside `<%= %>` tags,
  but you do want to include them in `<% %>` tags. There are a million
  different things which can cause the "undefined: JST" error: please ask
  your TA if you're stuck on it.
* The render function should populate the `$el` property of the view with
  an unordered list `<ul>` of our post titles.
* At first we can just iterate over the list of posts in the template. In
  just a minute, we'll convert the `render` method to use the
  [CollectionView pattern][collectionview].
* Manually instantiate the `PostsIndex` view and render it onto the
  page; you don't need a `Router` yet.
    * Go ahead and make an AJAX call on page load to get the `Post`s.
      This AJAX call will happen outside the view (usually would happen
      in your router). **NOTE:** You don't need to do this manually with
      `$.ajax()`. Instead, use your `Posts` collection's `fetch()` method
      to do the dirty work for you.
* Now that we see our collection is being fetched properly lets take this a
  step further and build some `PostsIndexItem` views to hold each
  individual post in this list.
* A `PostsIndexItem` is for rendering a single post in the Posts Index.
  * Create a template for this view that renders the post title.
  * Use the [`tagName`][bb-el] property to make this view's `$el` an `li` tag
    rather than the default `div`.
* Back in the `render` method of our `PostsIndex` view, iterate over the
  collection of posts, creating `PostsIndexItem`s for each.
* Append the rendered `$el` of the `PostsIndexItem`s into the `ul`
  tag of the `PostsIndex` view.
* Add a delete button in the `PostsIndexItem` view template, next to the title.
    * **NB:** Since the view already has a reference to the model, we don't
      need to add any extra information (such as a `data-id`) to the
      delete button.
    * Set a CSS class for the delete button.
    * In the `events` attribute of the `PostsIndexItem` view, install a click
      handler on the delete button.
* Use `listenTo` to listen for the `"remove"` event that will be fired
  from the underlying collection. Re-render the `PostsIndex` in this case.
* Also go ahead and `listenTo` `reset` events
  * To trigger the `reset` event, you will want to `fetch` your posts
    collection with a `reset: true` option. This will prevent the
    wasteful triggering of an `add` event as each individual fetched
    model is added to our collection. This is desirable when making our
    initial fetch of the collection.

[collectionview]: https://github.com/appacademy/backbone-curriculum/blob/master/w7d3/collection-view-pattern.md
[bb-el]: http://backbonejs.org/#View-el

## Phase III: Build a `PostShow` view class; write the Router

* Build a view class and template to show a post.
* Just show the title/body.
* Add a `PostsRouter` class. You should have two routes:
    * `""` (empty string): install the `PostsIndex` with all the `Posts`.
    * `posts/:id`: display a single `Post`.
* Instantiate the router in the `initialize` method of your Backbone app (found
  in `your-app-name.js`).
* When constructing the router, you should pass in the DOM
  element that it controls. It should swap content in and out of this
  element using the swapping router pattern. We don't want zombie views!
* After the router is instantiated, call `Backbone.history.start()` so
  Backbone will start listening for changes in the URL.
* In the router's `show` route, you'll need to provide the appropriate
  `Post` model instance as the `model` for your `PostShow` view instance.
  Use the `getOrFetch` method from Phase I to retrieve the model by ID.
* Throw a "Back to Index" link on your `PostShow`.

## Phase IV: Build a `PostForm`

* We want to create and edit journal posts. This can de done using a
  single, shared view and template.
* You'll need:
    * A `PostForm` Backbone view.
    * A `post_form` EJS template.

### Edit

* We'll start with editing.
* Link to the edit form for each post from both the index (via your
  `PostsIndexItem` template) and from the post's show page.
* In the router, get the `Post` object and pass it as the `model`
  property of the `PostForm`.
* On submit button click:
    * Set the attributes of the `Post`. Check out the
      [jQuery serialization][jquery-serialize] docs to extract values
      from the form.
    * Call `Model#save` with the attributes as the first argument, and an
      [options-hash][model-save] as the second argument.
    * On success, navigate to the post's show page. Use
      `Backbone.history.navigate(url, {trigger: true})`.
      * **Note:** You'll have issues if you forget `{trigger: true}`.
    * On failure, inject the validation errors into the page. Make sure
      that you don't lose the user's input, though.

[model-save]: http://backbonejs.org/#Model-save
[jquery-serialize]: https://github.com/appacademy/js-curriculum/blob/master/w6d5/ajax-remote-forms.md
[router-docs]: http://backbonejs.org/#Router-navigate

### New

* Add a `#/posts/new` route.
* In the route, build a new, blank `Post` object.
* Pass the new `Post` model to the `PostForm` view.
* Also pass the `Posts` collection to the `PostForm` (as attribute
  `collection`).
* On save, `add` the model to the collection. Then use
  `Backbone.history.navigate` to navigate to the post's show page.
  * You might worry that we'll create duplicate posts when we `add` the
    post model to our collection after editing a preexisting model.
    However, by default, Backbone will ignore attempts to add a model to
    a collection if a model with the same `id` already exists in the
    collection.
  * Now you might worry that the collection's copy of the model won't
    have a post's updated attributes after we edit it. However, as long
    as you use the `getOrFetch` pattern when passing your model to the
    PostForm view for editing, then there's no such thing as "the
    collection's copy of the model." The collection's model and the
    view's model are the same object in memory.

## Phase V: `listenTo`

* Right now we have one area which presents all the content.
* I would like to put a sidebar on the left that displays the index.
* Clicking on the links should swap out the content on the right.
* Probably want two divs: `sidebar` and `content`.
* On initialization, install a `PostsIndex` in the sidebar div;
  this view should never be removed by the Router. The sidebar is
  constant.
* There is one major thing to fix: when we create a new `Post` through
  the form, we need to update the `PostsIndex` to show the new `Post`.
  Likewise, when we edit a post's title, we want the updated title to be
  reflected in the index.
* The way to accomplish this is to call `listenTo` to get the View to
  monitor the `PostsCollection` for events. Check the
  [Backbone.Collection docs][backbone-collection] for the collection
  events you can listen for.
  * Hint: most events that occur on a model will also "bubble up" and be
    triggered on any collection containing that model, as well.
* When one of these events fires, re-render the index view.
* Put a `sleep 2` at the top of your PostsController#update action. Now
  refresh the page and edit a post. Does the title change in the index
  before your page redirects to the posts's show page? This is a little
  awkward. Try including a `wait: true` option when saving the post.
  This will delay the triggering of `change` events until after the
  server has responded successfully, and should synchronize your sidebar
  with your main content.
* You can remove the `sleep 2`.

[backbone-collection]: http://backbonejs.org/#Collection

## Phase VI: root route

* Add a 'Delete this Post' button to your show page. When deleting a
  post, we also want to clear it from the page and from the url bar. To
  accomplish this, let's add a Backbone route matching `''` that calls a
  router method called `root`.
* This router method should remove the router's `_currentView`, if one
  exists, and then `null` out the `_currentView`.
* Navigate to this route in the delete method of your PostShow view.

## Phase VII: Fancy edit

* Add the ability to edit an article from the show view. The user double
  clicks a particular section (like 'title' or 'body'). Double clicking
  the attribute should replace it with an input box containing the attribute's
  content. On blur of that input box, you should save the recently
  edited attribute. [Here's a list of events!][js-events] you can bind to.
* You shouldn't just be rendering a whole edit form
  again. Instead, it should appear as if you are making changes
  in place.

[js-events]: https://developer.mozilla.org/en-US/docs/Web/Reference/Events
