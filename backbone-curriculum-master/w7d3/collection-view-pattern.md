# CollectionView Pattern

Often times you'll want to render a collection of items. One way to accomplish
this is to iterate over the collection of items in the template like this:

```js
<ul>
  <% examples.each(function (example) { %>
    <li><%= example.escape('title') %></li>
  <% }); %>
</ul>
```

This approach (iterating in template) is fine for simple lists of items, but to
add greater functionality and flexibility to each of the items, prefer rendering
a view for each of the items in the list from inside the view.

```js
// preferred
// app/assets/javascripts/views/example_index.js
tagName: 'ul',
render: function () {
  var content = this.template();
  this.$el.html(content);
  var that = this;
  this.collection.each(function (example) {
    var view = new BackboneExample.Views.ExampleItem({ model: example });
    that.$el.append(view.render().$el);
  });
  return this;
}

// app/assets/javascripts/views/example_show.js
tagName: 'li',
render: function () {
  var content = this.template();
  this.$el.html(content);
  return this;
}
```

## Resources
+  [codebeerstartup](http://www.codebeerstartups.com/2012/12/9-collection-views-in-backbone-js-learning-backbone-js/#.Uti4BWRDsSE)
