# Backbone.Router

Backbone.Router provides methods for routing our client-side pages. Each route 
will be mapped to a method in our router. Make sure to call 
`Backbone.history.start()` in your app initialize, so that the router can listen 
for changes in the URL [fragment][fragment]. 

**NB**: It is possible to have many routers, for simplicity sake let's **only use 
one for all of our backbone apps**.

## `routes`

The `routes` hash of a router will map URLs with parameters to functions in your 
router. Routes can contain parameters prefixed with colon, similar to symbols in 
rails. Check this out:

```js
routes: {
  '': 'index',
  'examples/new': 'new',
  'examples/:id': 'show',
  'examples/:id/edit': 'edit'
},
index: function () {},
show: function (id) {},
new: function () {},
edit: function (id) {}
```

**Notice**:
+  routes do not start with `/`
+  trailing `/` will fire different routes (`docs` != `docs/`)

## Resources
+  [Backbonejs.org](http://backbonejs.org/#Router)
[fragment]: http://en.wikipedia.org/wiki/Fragment_identifier
