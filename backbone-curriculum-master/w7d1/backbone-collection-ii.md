# Backbone.Collection II

## `comparator`

The comparator will be used to keep your models in sorted order. The comparator 
may be defined in 3 ways:
+  sortBy ( function with single argument )
+  sort ( function with two arguments )
+  attribute ( string indicating the attribute to sort by )

> "sortBy" comparator functions take a model and return a numeric or string
> value by which the model should be ordered relative to others. "sort"
> comparator functions take two models, and return -1 if the first model should
> come before the second, 0 if they are of the same rank and 1 if the first
> model should come after.

