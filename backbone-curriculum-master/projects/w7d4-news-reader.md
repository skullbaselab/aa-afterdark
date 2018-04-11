# News Reader


## Phase 0: Rails API

### Getting Started

0. We will email you a project skeleton.
0. Examine the schema, the models, the routes, and the controllers.
0. Create, migrate, and seed the database.
0. Using the browser, make sure that everything is working by visiting the index
and show urls for the `feeds` resource.
0. Using the rails console use the two custom methods in the `Feed` model to
create and reload an RSS feed. Make sure you understand how these methods work.

[rss-skeleton]: https://github.com/appacademy/news-reader

### Feeds with Entries and Reload

0. So, we have a nice `reload` method in our `Feed` model. This pulls down the
newest entries for the feed. It also causes the `updated_at` value for the feed
to be refreshed. Make a new method, `latest_entries`, that will `reload` the
feed if `updated_at` is older than `30.seconds.ago` (NB: There's nothing magical
about 30 seconds, but we do want to throttle our updates so that, when we have
many users requesting the same feed in rapid succession, we aren't constantly
making requests to the feed for updates). Return the association, `entries`,
at the end of this method. We should now be able to use `latest_entries` as an
association that will update the feed if the data in the database is stale and
return all `entries`. You will find an entry for
[this quickly updating feed][quickfeed] in the
provided `seeds.rb`; use it to make sure your method works correctly.
0. Let's update the show method for our `FeedsController`. Right now, visiting
the show route for a feed only includes the information about the feed
object. We want all the entries for that feed to also be packaged in the JSON.
We can do this easily by adding an additional arguments to the params hash we
give to `render`. Now, our only argument is `json: Feed.find(params[:id])`.
If we add `include: :latest_entries` it will also include the `latest_entries`
for that instance of the `Feed` model. Ensure that this works by viewing the
json output from the show url for a feed before continuing.

[quickfeed]: http://lorem-rss.herokuapp.com/feed?unit=second&interval=10


## Phase I: JS Client with Backbone

### Setting up Feed Models and Collections

0. Using the `backbone-on-rails` gem, do a `rails g backbone:install --javascript`
to create the skeleton directory structure.
0. Visit the `root` url and make sure that backbone *says hello*.
0. Now, create a `Feeds` collection and `Feed` model in the appropriate folders.
Make sure you give the `Feeds` collection the correct `url`.
0. Refresh the page and in the javascript console on your web browser,
create a new instance of the collection and `fetch` it. Confirm that it worked by
looking at the `models` inside the collection.

### Feed Routes and Index View

0. In your `news_reader.js` root file (or whatever you called it) make sure
your `initialize` method is being called, creates a new instance of your router,
and calls `Backbone.history.start();`.
0. Create a feed index view and template. This should print the titles of all your feeds.
0. Add a router and make a route for `""`. Have this render your feed index.
0. The feed index should render upon a `sync` event. This event is triggered
when the collection's `fetch` function succeeds.
0. In your router, in the index route, make sure to `fetch` the `feeds`.
0. Show your TA when you have your `Index` view rendering properly.

### Entries

0. Create an `Entries` collection and `Entry` model.
0. The `url` property should be defined as a function that returns
  `this.feed.url() + '/entries'`. `this.feed` is going to be an instance
  variable we set upon creation. (We will go over this soon.)
0. Entries exist only as subordinates to feeds. For this reason it is
  appropriate to *nest* entries inside a feed object. Just like in rails where
  our `Feed` `has_many` `#entries`, our `Feed` model will have an `#entries()`
  function that will return a collection of `Entries`.
0. Create this `#entries` function. It should return an instance of the
 `Entries` collection, `this._entries`, if `this._entries` has already been
  created. If it has NOT been created, you will need to create a `new` instance
  of the collection passing in `{ feed: this }` as the *second* argument so we
  can correctly get our `Entries#url`. Set the newly created `Entries` collection
  to the `this._entries` instance
  variable, and return it. Now, whenever we try to access our nested `Entries`
  collection, we will be referring to the same instance of the collection. This
  is essential for `listenTo` events in our views.
0. As per our API, the actual entries come from the server through the `show`
  action on the `FeedsController`. This means that when we `fetch` our `Feed`
  *model*, the server should respond with info about the feed being fetched as
  well as the data for *all the entries*. We can use this nested entry data
  to populate the `entries` collection for a feed. To do this we must create
  a `Feed#parse(response)` function to parse the data from the server.

  The default behavior for `parse` is to simply pass on the response JSON to be
  set as the `attributes` of the model. When the response contains data for a
  nested collection, we must take the nested data out of the response and use
  it to populate the collection before passing on the remainder of the response.

  So: if the response passed into `parse` contains `latest_entries`,
  call `set` on our nested `entries` collection and give it the
  `latest_entries` as an argument. After populating the collection of
  `entries` with the `latest_entries` from the server, be sure to
  `delete response.latest_entries`, to remove the nested data from the
  response so it will not become part of the feed's `attributes`.
0. At this stage we should have both `Feeds` and `Entries` working. In the
  Javascript console in your browser, create a new instance of `Feeds` and fetch.
  Verify that all the feeds are there. Now for each `Feed` in the collection,
  call fetch the feed. This should successfully fetch all the entry data
  from the rails server.

**CALL YOUR TA OVER TO DEMONSTRATE YOUR SUCCESS WHEN THIS WORKS**

### Feed Show View
#### As long as you went to the index first...

0. In the router, we need to add a route that will show all the entries of a feed.
  `'feeds/:id'` should do the trick.
0. Make a new function: `#feedShow`, this will be called when the router detects
  the new route. Test this by having an `alert` pop up when the route is accessed.
  Make the content of this alert be the `id` of the feed you clicked on.
0. We need to modify our template for our index view so that each of our feeds
  will be links to the show action we just created. So, the `href` should probably
  be something like `#/feeds/<%=feed.id%>`.
0. Now, we should be able to click on a feed and see its `id` alert.
0. Now is probably a good time to add a link to the index in our `html.erb` template,
  so that you don't have to edit the browser's url by hand over and over to get there.
0. Ok, lets make a new view to display our feed. Create
  this view and template and have the router's `feedShow` action render this view
  and put it into the DOM. `get` the `Feed` from the collection, and pass it in
  as the `model` to the view. In the template, let's just `each` over each entry in
  the `entries` collection nested inside the `Feed` model. Create a new `<li>`
  and `escape` the title each entry model. When this succeeds, you should see
  all of the entries for your feed.
0. Make sure your router calls `fetch` on the `feed` or the entries will not be there
  when it comes time to display them. This is because the entries are not included
  in the `index` action in the `FeedsController`. We will also need to `listenTo`
  the feed's `sync` event and `render` our view again.
0. Your view should work. Visit the index, then click on a feed and view the
  entries. If this doesn't work, **get help from your TA**.

#### Even if you didn't start at the index...

  You may notice that when you start at the root url and visit the feed view,
  the entries are visible, but if you reload the page from the feed show view,
  there are no entries. Look in your JavaScript console, I expect that you see
  `Cannot read property 'entries' of undefined`. This means the `model` that
  should have been passed in is `undefined` when the view was created/rendered.

  We created the `NewsReader.Collections.feeds` collection when we first
  downloaded the JavaScript and started running our application, regardless
  of which router action we visited, if any. However, we didn't finish `fetch`ing
  the feeds before trying to display a particular feed  and `entries`. We don't
  have any feeds, how could we possibly have any entries?

  In this section, we will solve this problem using the `getOrFetch` pattern.
  `getOrFetch` is a function added on to the `Feeds` collection.
  If we are trying to pull a model out of a collection and suspect that there is
  a chance the model might not have been pulled from the rails server yet, we
  first try and `get` the object from `this` collection. If it is `undefined`,
  we create a `new` instance of the `Model`, `fetch` that, and upon success add
  the new empty model to the collection. We will return the empty model
  immediately, without waiting for it's fetch to succeed. The view waiting to
  render content from the model must be listening for the fetch to `sync`.

  * Add the `getOrFetch(id)` function to the `Feeds` collection.
  * If the model with the matching `id` exists, return that. If it is undefined
  we need to create a new instance of the `Feed` model. Call fetch on that `Feed`.
  In the success callback for `fetch`, add the new `Feed` to the collection.
  Return the instance of `Feed` whether you were able to `get` it or had to create
  a `new` one.
  * In the router, instead of `get`ing the feed from the collection and passing
  that to the `FeedView`, use our new `getOrFetch(id)` function to get the model.

### Bonus: More Functionality
  * Add a refresh button to the FeedShowView.
  * Make the entries in the Feed Show View subviews.
  * Add delete buttons to the Feeds Index.
  * Add a form to create a new Feed.

Once you complete the above basic functionality, add the following:

* Users & login
* Users have their own set of feeds
* Users can favorite feeds
* Users can favorite entries
