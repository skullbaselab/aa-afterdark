# Gist project

Today we're going to clone gist.github.com.

## Phase I: standard Rails features

* Clone the [NewAuthDemo project][new-auth-demo] to get `UsersController` and
  `SessionsController` for free.
* Write a `Gist` model.
    * `Gist` should be just a title for now; keep track of the owning
      user.
* Start writing the API. `GistsController#index` should return
  JSON for only the current user's `Gist`s.
* On login, cookie the user and redirect to a `RootsController`.  This 
  controller should have one action(`Roots#root`) that kicks off your single-page app.
* The main backbone view should display a list of `Gist`s. Build a `GistsIndex`
  view.

## Phase II: Favoriting in `Gist#show`

* Write a `GistDetail` view; it should just show the gist title and a
  favorite button.
    * Your `GistsIndex` view should set up many
      `GistDetail` views that render inside the index view.
    * If you want to boostrap your data through RABL, check out the second comment [here].
      You may have to make it .html_safe.
* Add a button to favorite a gist
    * You should add a `Favorite` model and `FavoritesController`.
    * Only let user favorite a gist once.
    * Here's an opportunity to nest a singular `Favorite` resource
      under `Gists`. You'll only need `create` and `destroy` actions
      at the nested level.
    * Also create a top-level `favorites` resource (plural). You only
      need an index on this (to get the favorites of the user).
* Add favorite/unfavorite buttons.
* On the server: When you send back a JSON representation of the `Gist`,
  also nest the user's `Favorite` object for that gist (or `nil`).
  Look up overriding [as_json][as_json].
* Change your `parse` method to build the associated `Favorite` when
  fetched. You may set the `url` property to `/gists/123/favorite`.
* Change your `gist` model's `toJSON` method so that the favorite is not uploaded to
  the server when the `gist` is saved. Require the client to save the favorite explicitly (by pressing the 
  favorite/unfavorite button).
* **You do not need a collection to do this**. You should write a
  client-side `Favorite` model. You should set its `url` to a function
  which uses the `gist_id` property to build `/gists/123/favorite`.

[here]: https://github.com/nesquena/rabl/issues/42
[as_json]: http://stackoverflow.com/questions/2572284/how-to-override-to-json-in-rails

## Phase III: Form View

### part A: Gist form

* Create a `GistForm` view.
* Add a link to your `GistsIndex` to build a new form.
* Add a submit button to the form; save the `Gist` to the database
  when clicked.

### part B: Nested GistFile

* Add a new model, `GistFile`; a `GistFile` has a name and body. It
  `belongs_to` a `Gist`.
* Many `GistFile`s make up a `Gist`.
* Change your `Gist` model's `parse` method so that it can build
  fetched `GistFile`s. The default `toJSON` method should allow you to
  save `GistFile`s.
    * Also build `GistFile`s through `Gist`s server-side when persisting.
* Create a `GistFileFormPart` template. It should contain a text box
  for a file name and a textarea for the body.
    * Render the form part template inside your `GistForm`.
* Test that things are working by building `GistFile`s on the server
  and that when you click to edit a `Gist`, it lets you edit the
  `Gist` and associated `GistFile`s.

### part C: new GistFiles

* Add a "new gist file" button to your `GistForm` view.
* It should add a new, blank `GistFile` object to your `Gist` and then
  re-render the form.

## Phase IV: Tags

### Part A: check boxes

We're going to take some inspiration from the [chosen][chosen-github]
library.

* Support tagging a Gist with topics.
* As usual, you should have `Tag` and `Tagging` models.
* First, setup a form with check boxes.
* You can read how to do this in the complicated forms chapters [1][nested-forms-i] and [2][nested-forms-ii].
* In particular, you'll need to make `Gist#tag_ids` `attr_accessible`.

### Part B: the start of a select widget

Of course, there can be many tags; let's make a text-search
dropdown.

The first step of our `TextSearchSelect` widget is to write a JS class
that takes a div and a list of items to select from. On creation, it
should insert a text input into the div. We don't need to give this a
name attribute, because it shouldn't be uploaded.

Next, on focus and blur of the text input, you should show/hide a ul
containing the items.

Write a method that will populate the ul with just the items matching
the current value. You can either use a `RegExp` or use the `indexOf`
String method to match the input value to the tag. You may want to
make sure the match is case insensitive.

To dynamically match while we type, we need a handler to watch
keyboard input. Unfortunately, the `change` event only gets fired
after the text has been input into the field and then focus is
changed. `keypress` is too early, that fires after the key is pressed
but before the character is inserted into the field. You want `keyup`.

### Part C: selecting the item

Okay, now we need to actually make the selection.

On page load, you should do an AJAX for all the `Tag` names
(`/tags`). Save this in a global variable (`Gist.tags`, perhaps).

Now we just need our form to upload an array of tag ids. The expected
`name` for the tag inputs is `"gist[tag_ids][]"`. The `[]` will tell
Rails that this is one element of an array of `tag_ids` (all under the
`gist` key).

Note that the selector needs the tag ids in addition to the names. So
you'll have to pass both into the selector.

You want your selector to add a `click` listener to each li. On each
click, the handler should insert a new hidden input tag into the form
with the value (a `tag_id`) already set. You must also set the name
correctly.

NB: the blur handler's removal of the ul form the DOM will happen
before a click on a li is registered. Because the ul gets removed
first, your click will never be registered. For simplicity, start by
just commenting out the blur handler. Later, you can add a short
timeout to give your clicks on an li a chance to register.

You will also want to add a visible representation of the tag, so that
the user can see what tags have been applied.

[chosen-github]: http://harvesthq.github.com/chosen/
[new-auth-demo]: https://github.com/appacademy/NewAuthDemo
[nested-forms-i]: https://github.com/appacademy/rails-curriculum/blob/master/w5d2/nested-forms.md
[nested-forms-ii]: https://github.com/appacademy/rails-curriculum/blob/master/w5d2/nested-forms-ii.md

## Phase V: bonus round
* Auto-save work while user is writing a gist.
* Add a button to up or down-vote (of course avoid page load).
* Add comments fields on gists.

## Resources

* http://www.simonecarletti.com/blog/2010/06/unobtrusive-javascript-in-rails-3/
