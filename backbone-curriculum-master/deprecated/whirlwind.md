# A Whirlwind Tour of Backbone

In this walkthrough, we build a Todos application.

* [Backbone documentation](http://backbonejs.org/)
* [Underscore documentations](http://underscorejs.org/)

Build it yourself as you go along, but you can also refer to my code
[on ze Github][todo-app-repo].

[todo-app-repo]: https://github.com/appacademy/TodoAppDemo

There are eight phases of this walkthrough; click on the section title
to jump to said section:

0. [Building out the Rails API](#phase-i-building-out-the-rails-api)
0. [Initial JS code](#phase-ii-initial-js-code)
0. [Backbone.View and Templates](#phase-iii-backboneview-and-templates)
0. [Events](#phase-iv-events)
0. [The Router](#phase-v-the-router)
0. [Models and Collections](#phase-vi-models-and-collections)
0. [Models and Rails API](#phase-vii-models-and-rails-api)
0. [Attaching listeners](#phase-viii-attaching-listeners)
0. [Mission success!](#phase-ix-mission-success)

## Phase I: Building out the Rails API

Our JS Backbone app is going to lean on a fairly traditional Rails app
as an API. In particular, the Rails app will be responsible for
persisting and fetching state to the database. We'll still have model
and controller layers, but our server-side view logic is going to be
stripped way down.

### `Task`

First, let's create a `Task` model

```ruby
# db/migrate/20130421205022_create_tasks.rb
class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title

      t.timestamps
    end
  end
end

# app/models/task.rb
class Task < ActiveRecord::Base
  validates :title, :presence => true
end
```

Note that in addition to persisting the data to the DB, the Rails app
is going to have responsibility for the validations on the data; you
can't blindly trust the data uploaded by the user.

### `TasksController`

Our Rails app needs to be able to fetch and save `Task`s for the
client.  Sounds like a job for a controller!

```ruby
# app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  respond_to :json

  def create
    @task = Task.new(task_params)

    if @task.save
      render :json => @task
    else
      render :json => @task.errors, :status => 422
    end
  end

  def index
    @tasks = Task.all
    render :json => @tasks
  end
  private
  
  def task_params
    params.require(:task).permit(:title)
  end
end
```

Notice how I render the errors when failing to save the tasks. I
return the status code 422 which means "Unprocessable Entity". This
status code means that the user POSTed to a valid path, but that the
"entity" posted wasn't valid ("processable").

And of course, the routes file:

```ruby
# config/routes.rb
TodoApp::Application.routes.draw do
  resources :tasks, :only => [:create, :index]
end
```

## Phase II: Initial JS code

Create a JS file that will hold our top-level Todo code in the TD
namespace.

```javascript
// app/assets/javascripts/todo.js
window.TD = {
  // we'll eventually store Backbone classes inside of these namespaces
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  
  initialize: function ($rootEl, tasks) {
    // we'll call `TD.initialize(rootEl, tasks)` from our HTML to
    // kick-off the JS client code.
    
    console.log("Achievement Unlocked: JS Client Code Runs!");
    console.log(tasks);
  }
};
```

Let's set it up so that `TasksController#index` can return a page that
kicks off the JS code:

```html
<!-- app/views/tasks/index.html.erb -->
<script type="application/json" id="bootstrapped_tasks_json">
  <%= Task.all.to_json.html_safe %>
</script>

<script type="application/javascript">
  $(function () {
    // Bootstrap initial `Task`s.
    var tasks = JSON.parse($("#bootstrapped_tasks_json").html());

    // start me up!
    window.TD.initialize($("body"), tasks);
  });
</script>
```


```ruby

 app/controllers/tasks_controller.rb
class TasksController < ApplicationController
  respond_to :json
  respond_to :html, :only => [:index]

  def create
    # ...
  end

  def index
    @tasks = Task.all
    respond_to do |format|
      format.html { render :index } # entry-point for Backbone app
      format.json { render :json => @tasks }
    end
  end
end

# config/routes.rb
TodoApp::Application.routes.draw do
  resources :tasks

  root :to => "tasks#index"
  # delete public/index.html afterwards
end
```

Okay; try it out! We're now running JavaScript!

## Phase III: Backbone.View and Templates

Okay; we have bootstrapped our JS application, but all it does is
`console.log` our Task objects. We need to start using Backbone; so
let's add it to the Gemfile: `gem 'backbone-on-rails'`.

### JS File Layout

In Rails, we split up our Ruby code and spread it out across many
files. We will do the same for Backbone. Here's the standard format to
subscribe to:

* app/assets/javascripts
    * [app_name].js
        * You already made this!
    * /collections
    * /models
    * /routers
    * /views

You'll learn what collections, models and views are soon! Each type of JS
file goes in its own directory, just like Rails code goes into
`app/controllers`, `app/models`, and `app/views`.

We'll need to have the client download all these various JavaScript
files. Later, we'll learn how the Rails **asset pipeline** works. For
now, we'll just configure it to send all the various JS files to the
client.

Here's how we set up the `app/assets/javascripts/application.js`
**manifest file** to load everything:

```javascript
// app/assets/javascripts/application.js
//
// Libraries from gems:
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//
// Your top-level namespace:
//= require todo
//
// Directories with Backbone classes:
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./routers
//= require_tree ./views
```

The manifest tells the asset pipeline what static JavaScript files
(called **assets**) to serve. Here we're careful to require `todo.js`
first; our other JS source files will need the global namespace
(`window.TD`) to be defined first because they will store classes in
the `window.TD` namespaces.

You can kind of see how this is directing the asset pipeline to
require the many files we have specified. We'll learn exactly how this
works at a later date.

### Our First `Backbone.View`: `TasksListView`

Let's create a class that will be responsible for rendering the
view. A `Backbone.View` subclass is kind of like a Rails controller:
it is responsible for rendering a template (more soon!), and it has
actions. Unlike a Rails controller, which only lives for one HTTP
request-response cycle, a `Backbone.View` continues to manage its
portion of the window until it is removed. Events (like clicks) that
occur in the managed area are delegated to methods in the view class.

NB: a `Backbone.View` is **not** like the views we worked with in
Rails. Rails views are better called templates.

Let's see our first view in action:

```javascript
// app/assets/javascripts/views/tasks_list_view.js
TD.Views.TasksListView = Backbone.View.extend({
  render: function () {
    var that = this;
    
    var ul = $("<ul></ul>");
    _(that.collection).each(function (task) {
      ul.append(
        $("<li></li>").text(task.title)
      )
    });

    that.$el.html(ul);
    return that;
  }
});

// app/assets/javascripts/todo.js
window.TD = {
  // we'll eventually store Backbone classes inside of these namespaces
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  
  initialize: function ($rootEl, tasks) {
    var tasksListView = new TD.Views.TasksListView({
      collection: tasks
    });
    
    $rootEl.html(tasksListView.render().$el);
  }
};
```

Okay, let's talk about `Backbone.View.extend` briefly. This method
creates a subclass of `Backbone.View`; you define custom methods of
the subclass in the object passed to `extend`. Likewise, when you
construct `TD.Views.TasksListView`, you can pass in parameters by name
in a JS object.  Here we set the `collection` attribute of the
`Backbone.View` we construct. The `render` method we define iterates
through this property, rendering the various `Task`s.

The most important method for you to implement in your `Backbone.View`
subclass is `render`. This method should render the model data into
the `$el` attribute.

Every view has a "root element", `$el`, that it is responsible
for. Backbone will provide this for you: `$el` by default contains a
blank `div` element for you to add content to in your `#render`
method. In most cases, the caller that requests the render will then
insert `$el` into the DOM when it is ready.

By convention, `render` is supposed to return the view object itself;
this allows us to write:

    $(rootEl).html(tasksListView.render().$el);

We won't see the full power of `Backbone.View` for a little bit; their
main utility comes from (a) listening for and responding to DOM events
and (b) listening to events on Backbone collections (for instance, if
new model objects are added/deleted).

### EJS Templates

You may have noticed how I built up the HTML content in
JavaScript. Time to bring templates back into the mix.

We're going to use EJS templates. EJS is underscore templates, but
instead of being forced to insert them into our HTML page inside
script tags, we're going to:

0. Compile the template code to a JavaScript function **on the
   server**.
0. Serve the compiled JavaScript code to the client.

Add `gem 'ejs'` to your Gemfile.

Templates are stored in the `app/assets/templates` directory. Rails
does not usually expect assets to be in the `app/assets/templates`
directory, so in `config/application.rb`, add `config.assets.paths <<
"app/assets/templates"` to the end of the configuration.

You'll need to add the templates directory to your manifest:

```javascript
// app/assets/javascripts/application.js
// Libraries from gems:
//= require jquery
//= require jquery_ujs
//= require underscore
//= require backbone
//
// Your top-level namespace:
//= require todo
//
// Directories with Backbone classes:
//= require_tree ./models
//= require_tree ./collections
//= require_tree ./routers
//= require_tree ./views
//
// EJS Templates
//= require_tree ../templates
```

Here's how EJS templates work. The asset pipeline will **compile our
EJS to JavaScript functions**. For example:

```
<!-- app/assets/templates/tasks/list.jst.ejs -->
<ul>
  <% _(tasks).each(function (task) { %>
    <li><%= task.title %></li>
  <% }); %>
</ul>
```

The EJS gem will compile this template to a JS function saved in
`JST["tasks/list"]` (JST is for JS Template). As with underscore
templates, we call the function to render the template:

```javascript
// app/assets/javascript/views/tasks_list_view.js
TD.Views.TasksListView = Backbone.View.extend({
  render: function () {
    var that = this;
    
    var renderedContent = JST["tasks/list"]({
      tasks: that.collection
    });

    that.$el.html(renderedContent);
    return that;
  }
});
```

This is a major advantage, because we

0. No longer need to mix template code into our Rails templates.
0. No longer need to tediously load and compile the template code
   ourselves.
0. The templates are delivered to the client pre-compiled to JS
   functions, which involves transfering much less data.

## Phase IV: Events

Let's start binding handlers for events in the view. Eventually we'll
use the handlers to display new views, but we'll start out real
simple.

First, let's modify our template somewhat:

```
<!-- app/assets/templates/tasks/list.jst.ejs -->
<ul>
  <% _(tasks).each(function (task) { %>
    <li class="task" data-id="<%= task.id %>">
      <%= task.title %>
    </li>
  <% }); %>
</ul>
```

I've added a `data-id` attribute to store the id of the task we're
talking about. Attributes names of the form `data-*` are used to store
data in a DOM element.

Okay; let's get the view to attach a handler to click events on
`li.task` elements:

```javascript
// app/assets/javascript/views/tasks_list_view.js
TD.Views.TasksListView = Backbone.View.extend({
  events: {
    "click li.task": "showTask"
  },

  render: function () {
    var that = this;

    var renderedContent = JST["tasks/list"]({
      tasks: that.collection
    });

    that.$el.html(renderedContent);
    return that;
  },

  showTask: function (event) {
    console.log(
      ("You clicked task #" +
        $(event.currentTarget).attr("data-id") +
          "! So good a click!")
    );
  }
});
```

The `events` attribute holds an object where (a) the keys are of the
format "eventName cssSelector" and (b) the values are names of methods
to invoke on the view in response to the event.

Try it out!

## Phase V: The Router

We want to allow the user to navigate from the task index page to a
detailed view of a single task. Soon we'll build a second
`TaskDetailView` (and corresponding template), but first we need to
know how to navigate inside a Backbone app.

Navigation inside a Backbone app is handled by
`Backbone.Router`. Let's introduce a router into our lives:

```javascript
// app/assets/javascript/todo.js
window.TD = {
  // we'll eventually store Backbone classes inside of these namespaces
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  
  initialize: function ($rootEl, tasks) {
    new TD.Routers.TasksRouter($rootEl, tasks);
    Backbone.history.start();
  }
};

// app/assets/javascripts/routers/tasks_router.js
TD.Routers.TasksRouter = Backbone.Router.extend({
  initialize: function ($rootEl, tasks) {
    this.$rootEl = $rootEl;
    this.tasks = tasks;
  },
  
  routes: {
    "": "index",
    "tasks/:id": "show"
  },
  
  index: function () {
    var that = this;
    
    var tasksListView = new TD.Views.TasksListView({
      collection: that.tasks
    });
    
    that.$rootEl.html(tasksListView.render().$el);
  },
  
  show: function (id) {
    console.log("I'm just getting warmed up!");
  }
});
```

The router defines path patterns; when the user clicks on a link that
matches the pattern, the router will run the specified method. We've
stored a root element with the router; the routing methods will
instantiate a view and render its template into the root.

In our `initialize` method we construct the router and tell Backbone
to start listening for navigation events
(`Backbone.history.start()`). Future navigation events will be handled
by the router.

The primary benefit of `Backbone.Router` is that the router will take
care of transitioning from one view to the next.

### Links

Let's get some links going! First, let's remove the event stuff from
`TasksListView`:

```javascript
// app/assets/javascripts/views/tasks_list_view.js
TD.Views.TasksListView = Backbone.View.extend({
  render: function () {
    var that = this;

    var renderedContent = JST["tasks/list"]({
      tasks: that.collection
    });

    that.$el.html(renderedContent);
    return that;
  }
});
```

And now let's update the corresponding template:

```
<!-- app/assets/templates/tasks/list.jst.ejs -->
<ul>
  <% _(tasks).each(function (task) { %>
    <li class="task">
      <a href="#/tasks/<%= task.id %>">
        <%= task.title %>
      </a>
    </li>
  <% }); %>
</ul>
```

Okay, getting close. You should now be displaying a list of
links. Clicking one will invoke the router action which prints the
message. The URL should change.

Note that our link href is `#/tasks/<%= task.id %>`. If we linked to
`/tasks/<%= task.id %>` the browser would make a request to the server
for a new page. The traditional way to make links that don't make new
page requests has been to use the URL **fragment identifier**: the bit
after the `#`.

### Replacing the content

Okay, now we need to actually build another view for the details:

```javascript
// app/assets/javascripts/views/task_detail_view.js
TD.Views.TaskDetailView = Backbone.View.extend({
  render: function () {
    var that = this;

    var renderedContent = JST["tasks/detail"]({
      task: that.model
    });

    that.$el.html(renderedContent);
    return that;
  }
});
```

Note that this view uses the `model` property; it only represents a
single item here, not a `collection` of models.

We also write a new template:

```
<!-- app/assets/templates/tasks/detail.jst.ejs -->
<h2><%= task.title %></h2>

<p>
  You've got your work cut out for you!
</p>

<a href="#/">Back!</a>
```

Okay, let's actually perform the navigation!

```javascript
// app/assets/javascripts/routers/tasks_router.js
TD.Routers.TasksRouter = Backbone.Router.extend({
  initialize: function ($rootEl, tasks) {
    this.$rootEl = $rootEl;
    this.tasks = tasks;
  },

  routes: {
    "": "index",
    "tasks/:id": "show"
  },

  index: function () {
    var that = this;

    var tasksListView = new TD.Views.TasksListView({
      collection: that.tasks
    });

    that.$rootEl.html(tasksListView.render().$el);
  },

  show: function (id) {
    var that = this;

    var task = _(that.tasks).findWhere({ id: parseInt(id) });
    var taskDetailView = new TD.Views.TaskDetailView({
      model: task
    });

    // replace `$rootEl` contents with the rendered TaskDetailView
    that.$rootEl.html(taskDetailView.render().$el);
  }
});
```

## Phase VI: Models and Collections

### Adding a `NewTaskView`

Let's start to give the user the ability to write new tasks. Step one
is to write a form:

```
<!-- app/assets/templates/tasks/new.jst.ejs -->
<form>
  <h1>New Task</h1>
  <label for="task_title">Title</label>
  <input name="task[title]" id="task_title">

  <button class="submit">Submit!</button>
</form>
```

And a view:

```javascript
// app/assets/javascripts/views/new_task_view.js
TD.Views.NewTaskView = Backbone.View.extend({
  events: {
    "click button.submit": "submit"
  },

  render: function () {
    var that = this;
    
    var renderedContent = JST["tasks/new"]();
    that.$el.html(renderedContent);
    return that;
  },
  
  submit: function () {
    console.log("Yo dawg, I heard you like saving models.");
  }
});
```

And let's update the router:

```javascript
// app/assets/javascripts/routers/tasks_router.js
TD.Routers.TasksRouter = Backbone.Router.extend({
  // ...

  routes: {
    "": "index",
    "tasks/new": "new",
    "tasks/:id": "show"
  },
  
  // ...
  
  new: function () {
    var that = this;
    
    var newTaskView = new TD.Views.NewTaskView();
    that.$rootEl.html(newTaskView.render().$el);
  },

  // ...
});
```

### Using Models and Collections

Let's write a Backbone `Task` model and `Tasks` collection. A `Model`
instance is analogous to the `ActiveRecord::Base` object. A
`Collection` is a new one on us: it keeps track of a collection of
model objects. We'll learn more about it soon:

```javascript
// app/assets/javascripts/models/task.js
TD.Models.Task = Backbone.Model.extend({
  // add model methods here; we have none to add right now
});

// app/assets/javascripts/collections/tasks.js
TD.Collections.Tasks = Backbone.Collection.extend({
  model: TD.Models.Task
});
```

Okay, let's wrap our bootstrapped `Task` data in `Task` objects:

```javascript
// app/assets/javascripts/todo.js
window.TD = {
  // we'll eventually store Backbone classes inside of these namespaces
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  initialize: function ($rootEl, tasksData) {
    var tasks = new TD.Collections.Tasks(tasksData);

    // startup a router
    new TD.Routers.TasksRouter($rootEl, tasks);
    // begin listening for navigation events
    Backbone.history.start();
  }
};
```

The collection will hold all the `Task` objects. Constructing it with
an array of raw data objects will have it wrap each raw object in a
`Task` model object.

We have to make a few changes because we're using `Model`s and
`Collection`s now:

```javascript
// app/assets/javascripts/routers/tasks_router.js
TD.Routers.TasksRouter = Backbone.Router.extend({
  // ...
  
  new: function () {
    var that = this;

    var newTaskView = new TD.Views.NewTaskView({
      collection: that.tasks
    });

    that.$rootEl.html(newTaskView.render().$el);
  },

  show: function (id) {
    var that = this;

    var task = that.tasks.get(id);
    var taskDetailView = new TD.Views.TaskDetailView({
      model: task
    });

    that.$rootEl.html(taskDetailView.render().$el);
  }
});
```

Here we use `Collection#get`, which returns the model object with the
matching `id`.

Inside our templates, we should use the `Model#escape` to get the
value of an attribute and escape it for safe HTML insertion:

```
<!-- app/assets/templates/tasks/list.jst.ejs -->
<ul>
  <% tasks.each(function (task) { %>
    <li class="task">
      <a href="#/tasks/<%= task.escape("id") %>">
        <%= task.escape("title")%>
      </a>
    </li>
  <% }); %>
</ul>

<a href="#/tasks/new">New Task!</a>

<!-- app/assets/templates/tasks/detail.jst.ejs -->
<h2><%= task.escape("title") %></h2>

<p>
  You've got your work cut out for you!
</p>

<a href="#/">Back!</a>
```

### Processing the form

Alright, let's actually get our form to work!

```javascript
// app/assets/javascripts/views/new_task_view.js
TD.Views.NewTaskView = Backbone.View.extend({
  events: {
    "submit form": "submit",
  },
  
  render: function () {
    var that = this;

    var renderedContent = JST["tasks/new"]();
    that.$el.html(renderedContent);
    return that;
  },
  
  submit: function (event) {
    var that = this;
    
    event.preventDefault();

    var formData = $(event.currentTarget).find("form").serializeJSON();
    var task = new TD.Models.Task(formData.task);

    that.collection.add(task);
    Backbone.history.navigate("#/");
  }
});
```

We use our good friend `$.serializeJSON` (as before, download it and
add it to `vendor/assets/javascripts`; add the require line to
`app/assets/application.js`). Here we build a new model object and add
it to the collection. We then have `Backbone` navigate us back to the
main page. The new `Task` will be included in the index list, as it
has been added to the collection.

Yay! It's alive!

## Phase VII: Models and Rails API

Okay, we add the new `Task` to the collection, but it doesn't actually
get persisted to the DB. The `Backbone.Model` class gives us a `#save`
method to save a model back to the server, but we need to specify a
`urlRoot` attribute.

```javascript
// app/assets/javascripts/models/task.js
TD.Models.Task = Backbone.Model.extend({
  urlRoot: "/tasks"
});

// app/assets/javascripts/views/new_task_view.js
TD.Views.NewTaskView = Backbone.View.extend({
  // ...
    
  submit: function () {
    var that = this;
    
    event.preventDefault();
    
    var formData = $(event.currentTarget).find("form").serializeJSON();
    var task = new TD.Models.Task(formData.task);
    
    that.collection.add(task);
    task.save();
    Backbone.history.navigate("#/");
  }
});
```

That's all!

## Phase VIII: attaching listeners

### Adding a second view

Okay, we've got basic functionality working. Let's up our game a bit. Let's
move the index out to a sidebar and float the content to the right.

```html+erb
<!-- app/views/tasks/index.html.erb -->
<div id="sidebar" style="float: left;"></div>
<div id="content" style="float: right;"></div>

<script type="application/javascript">
  $(function () {
    // bootstrap tasksData...

    window.TD.initialize($("#sidebar"), $("#content"), tasks);
  });
</script>
```

And we make corresponding JS changes:

```javascript
// app/assets/javascripts/routers/tasks_router.js
TD.Routers.TasksRouter = Backbone.Router.extend({
  // ...
  
  index: function () {
    var that = this;
    
    that.$rootEl.empty();
  }
});

// app/assets/javascript/todo.js
window.TD = {
  // ...
  
  initialize: function ($sidebar, $content, tasksData) {
    var tasks = new TD.Collections.Tasks(tasksData);

    this._installSidebar($sidebar, tasks);

    // startup a router
    new TD.Routers.TasksRouter($content, tasks);
    // begin listening for navigation events
    Backbone.history.start();
  },
  
  _installSidebar: function ($sidebar, tasks) {
    var that = this;
    
    var tasksListView = new TD.Views.TasksListView({
      collection: tasks
    });
    
    $sidebar.html(tasksListView.render().$el);
  }
};
```

This works great, except for one thing. Try creating a model through
the form. Notice that the sidebar doesn't update and add the new model
to the list. Why doesn't that work like it did before?

### Coordinating views: collection events

The problem is that the `NewTaskView` has updated the `Tasks`
collection, but the `TaskListView` hasn't updated itself to reflect
this change. It doesn't magically know that the collection has been
updated, so the view doesn't know to re-render itself.

To accomplish this, we need to tell the `TaskListView` to listen for
changes to the collection, and to re-render itself in response:

```javascript
// app/assets/javascript/views/tasks_list_view.js
TD.Views.TasksListView = Backbone.View.extend({
  initialize: function () {
    var that = this;
    
    var renderCallback = that.render.bind(that);
    that.listenTo(that.collection, "add", renderCallback);
    that.listenTo(that.collection, "change", renderCallback);
    that.listenTo(that.collection, "remove", renderCallback);
  },

  render: function () {
    var that = this;

    var renderedContent = JST["tasks/list"]({
      tasks: that.collection
    });

    that.$el.html(renderedContent);
    return that;
  }
});
```

This works like events on DOM objects: whenever a `Collection`
changes, Backbone fires an event on the collection (add, remove,
change). As with jQuery's `on` method, we have the option to
`listenTo` an event on an object (in this case the `Collection`) and
install a callback event handler.

In this case, we re-render the sidebar whenever any `Task`s are added,
removed, or modified.

Collections are important in Backbone because messages are propagated
from one view to another via callbacks like this.

## Phase IX: Mission success!

You made it! Wow! Good work! Maybe have a drink :-)
