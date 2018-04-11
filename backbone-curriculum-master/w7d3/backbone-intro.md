# Getting Started with Backbone on Rails

[Backbone.js][backbonejs] is a client side library for organizing js code into 
an MVC structure. This library is very well documented and relatively easy to 
read. Here is the [annotated source][annotated-source]. Reading the docs and 
the source will be invaluable. 

## `backbone-on-rails`

We will use a gem called [`backbone-on-rails`][backbone-on-rails] for:
+  setting up the javascript directory structure
+  generating basic boilerplate code 
+  serving backbone.js and underscore.js

Use `gem backbone-on-rails` in your Gemfile. 

**NB**: There are other backbone gems that you could use, prefer this 
backbone-on-rails.

### Generators

The default backbone-on-rails generators will generate 
coffeescript. We will use the `--javascript` option after all of our commands 
so that javascript files are generated.

`rails generate backbone:install --javascript`

This generator will create a {rails_app_name}.js file, some directories to 
put your javascripts and templates. This will also modify the app manifest to 
properly include the new assets. In this demo the rails app is named backboneExample.

```sh
~/D/D/A/w/p/backboneExample *master> rails g backbone:install --javascript
      create  app/assets/javascripts/models
      create  app/assets/javascripts/collections
      create  app/assets/javascripts/routers
      create  app/assets/javascripts/views
      create  app/assets/templates
      create  app/assets/javascripts/backbone_example.js
      insert  app/assets/javascripts/application.js
```

The backbone_example.js contains basic initialization for our MVC structure 
and an initialize method for booting the backbone app. Here is what it looks 
like:

```js
window.BackboneExample = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    alert('Hello from Backbone!');
  }
};

$(document).ready(function(){
  BackboneExample.initialize();
});
```

`rails generate backbone:scaffold Example --javascript` Replace _Example_ here 
with the name of your model.

Although backbone does a really great job organizing js code, one of the biggest 
complaints about the library is that it uses a lot of boilerplate code. The 
backbone:scaffold generator will generate some of that code for us.

```sh
~/D/D/A/w/p/backboneExample *master> rails g backbone:scaffold Example --javascript
      create  app/assets/javascripts/models/example.js
      create  app/assets/javascripts/collections/examples.js
      create  app/assets/javascripts/routers/examples_router.js
      create  app/assets/javascripts/views/examples
      create  app/assets/javascripts/views/examples/examples_index.js
      create  app/assets/templates/examples
      create  app/assets/templates/examples/index.jst.ejs
```

As you can see from above there are many files generated. These each contain a 
nice skeleton for us to start working with. 

**NB**: The backbone:scaffold generator will generate a router. We will just use 
one router for our entire app.

[backbonejs]: http://backbonejs.org/
[backbone-on-rails]: https://github.com/meleyal/backbone-on-rails
[annotated-source]: http://backbonejs.org/docs/backbone.html
