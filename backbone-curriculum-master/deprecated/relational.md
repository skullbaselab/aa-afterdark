# Backbone.Relational

```
Models.Users = Backbone.RelationalModel.extend({
  relations: [{
    type: "HasMany",
    key: "tweets",
    relatedModel: "Models.Tweets",
    collectionType: "Collections.UserTweets",
    includeInJSON: false,
    reverseCollection: {
      key: "author",
      keySource: "user_id",
      includeInJSON: "id"
    }
  }]
});
```

**TODO**: describe how to deal with many-to-many relationships,
esp. how to post nested attributes to the server.
