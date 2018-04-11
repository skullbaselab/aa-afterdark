# Maps on Backbone on Rails

- Rule one of Maps Club: Don't put your map in an element that's not in the DOM.
- Rule two of Maps Club: Don't put your map in an element that's not in the DOM.

## Links
- [Live demo!](http://google-maps-demo.herokuapp.com/)
- [Common Gotchas](#common-gotchas)

## Phase 0: Accessing the API
First, navigate to Google's [Javascript API tutorial][google-tutorial] and take
a look at their "Hello World" code. In order to access the Google Maps API,
we'll need to download the code from their servers. That means adding a
`<script>` tag to our `application.html.erb`:

[google-tutorial]: https://developers.google.com/maps/documentation/javascript/tutorial#HelloWorld

```html
<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js"></script>

<!-- javascript include tag -->
```

This will do just fine in development. However, when you push to production, you
may want an API key (which will give you a higher daily request limit). To
prevent others from abusing your API key, you'll want to restrict access and
whitelist your Heroku app's domain. Unfortunately, this means you'll no longer
be able to use your API key on localhost. Here's a workaround:

```html
<% if Rails.env.production? %>
  <% api_key = "key=AIzaSyBF_Ppz0dfiXFAf0oaaYaUVF0HnazPN_-E" %>
<% else %>
  <% api_key = '' %>
<% end %>

<script type="text/javascript"
        src="https://maps.googleapis.com/maps/api/js?<%= api_key %>"></script>

<!-- javascript include tag -->
```

You can find details on obtaining and securing an API key
[here][obtaining-api-key].

[obtaining-api-key]: https://developers.google.com/maps/documentation/javascript/tutorial#api_key

## Phase 1: Adding a Basic Map to the DOM
We're going to use a Backbone View to store our map and any helper functions
or event handlers we might need. First and foremost, we'll need to add a
Google map as a property of the view. The `google.maps.Map` constructor
requires a DOM element to insert itself into; in our example we'll be using
the view's `el` directly (no template required). It's typical to give the
container div a unique id like `map-canvas`; you can set this in the view's
`attributes` hash. For an example of a very bare-bones map view, see the code
for this [view][basic-map] and [router][router].

[basic-map]: ./app/assets/javascripts/views/map_show_basic.js
[router]: app/assets/javascripts/routers/app_router.js

**NB**: Pay special attention to the modified `_swapView` method in the router.
There is an [issue][issue-1448] with the way the map resizes itself, and if you
want a properly-sized map then you MUST put the map element on the page before
initializing the map object.

[issue-1448]: https://code.google.com/p/gmaps-api-issues/issues/detail?id=1448

Our goal here is to make the map as self-sufficient as possible. We'll
do our initial setup here and let event handlers do the bulk of the work later on.

## Phase 2: Adding Markers
Map markers are merely JavaScript objects that store a pointer to a map. They
live on that map until their pointer is changed; change the pointer to `null`
and the marker will be removed. In principle, adding markers is very similar to
the CompositeView's [collection add/remove][composite-view] pattern. In summary:
we'll pass a collection to the map view, add a marker for each model in
`initialize`, and `listenTo` `add` events so we can add new markers. Let's also
`listenTo` `remove` events so we can remove dead markers. You can store the
markers how you like; I chose a hash, since that makes it easy to look up
markers and prevent the creation of any duplicates. [Here's][marker-map] a
sample implementation. Again, this is fairly bare-bones and only intended as a
starting point; if you want to get more sophisticated, refer to the docs.

[composite-view]: https://github.com/appacademy/composite_view#collection-add
[marker-map]: ./app/assets/javascripts/views/map_show_markers.js

## Phase 3: Event Handling
You're already familiar with event handling in jQuery and Backbone.
The `map` object can also trigger events, but the syntax for registering event
handlers is somewhat different (and you can't just use the Backbone View's
`events` hash). I like to put these event handlers in an `attachMapListeners`
 helper method that gets called after the map is set up.

Play around with [this][map-events] page of common events to see which events
best fit your needs.

[map-events]: https://developers.google.com/maps/documentation/javascript/events

If you plan to have an interactive map, one of your most important features will
be the ability to fetch search results based on the map's visible area. There
are two pieces of this puzzle: an `api/search` route, and a map event handler
(let's call it `search`). The basic idea is that we get the latitude and
longitude of the map's boundaries, then query the database for models with
coordinates in that range. Refer to my implementation of the [map][event-map]
and the [controller action][listings-controller] as starting points.

[event-map]: ./app/assets/javascripts/views/map_show_events.js
[listings-controller]: ./app/controllers/api/listings_controller.rb#L22

## Nesting Map Views
It's fairly common to want to keep the map in sync with some other view
(possibly a `SearchResults` view). Here are a few ways you could accomplish
this:

0. Use a global collection and pass it to all relevant views
0. Create a parent view that has the map as a subview. Pass the parent view's
   collection to the map and whichever subviews need to be kept in sync.

I've taken the second approach in the demo code, as it allows views to share
information without polluting the global namespace. As always, beware of
rendering the map before its `$el` is in the DOM.

## Additional Resources
When starting on a new feature for the first time, the Google [Developer's
Guide][dev-guide] is very helpful. They have some good basic examples of common
features, and it's fairly easy to tailor their code to your particular needs.

If you need more detailed information on a feature (for example, the types of
the arguments passed into the constructor), the [API Reference][api-reference]
has the answers you seek.

[dev-guide]:
https://developers.google.com/maps/documentation/javascript/overlays

[api-reference]:
https://developers.google.com/maps/documentation/javascript/reference

## Common Gotchas

### AdBlock
Ad blocking plugins can prevent the Google Maps script file from downloading
properly. If you're getting an error that says `BLOCKED_BY_CLIENT` or something
similar, try disabling these extensions or opening an incognito window to test
your app.

### Element Height
By default, the map will resize itself to fill its container. If you try to put
the map in an empty `<div>`, it may not show up (since a `<div>` with no content
will, by default, collapse to a height of 0). I have the following lines in my
`application.css` to make sure the map shows up.

```css
html, body, #map-canvas {
  height: 100%;
  margin: 0;
  padding: 0;
}
```

### Spontaneous Resizing
So you made sure your map element was already in the DOM, but you're still
having trouble with the map spontaneously resizing. You did make sure your map
element was already in the DOM, right? Perhaps you have other elements resizing
dynamically. In that case you may need to implement a workaround. Try adding the
following code after the problematic page element is resized:

```javascript
google.maps.events.trigger(yourMapObject, 'resize');
```

If this pulls your map off-center, you may want to add another line to set the
center of the map.
