# REST

The following statements are extracts from the book `Subramanian, Vasan. Pro MERN Stack: Full Stack Web App Development with Mongo, Express, React, and Node.` Feel free to use your judgment (or poll student opinions) regarding which precise topics to cover.

> REST (short for **RE**presentational **S**tate **T**ransfer) is an architectural pattern for application programming interfaces (APIs) . There are other, older patterns such as SOAP and XML-RPC, but as of late, the REST pattern has gained popularity.

> Since the APIs are only for internal (i.e. employee) consumption, you can use any API pattern, or even invent your own. But REST is a good pattern to adopt because it is simple, consistent, and has very few constructs to memorize. Further, adopting an existing popular pattern makes you think about your APIs and schema and organize them better, encouraging best practices. 

> There are many architectural constraints that true REST APIs must follow. But keeping in mind that the APIs are only for internal consumption, we’ll just focus on a few core concepts of the REST API architectural pattern rather than follow it too strictly. If you ever decide to expose the APIs to others, you can always strengthen the RESTfulness of the API set.

## Resource-Based

> The first thing to keep in mind is that RESTful APIs are resource-based (as opposed to action-based). Thus, you will not find API functions like `getSomething` or `saveSomething`. In fact, there are no API functions because APIs are formed by a combination of resources and actions. Resources are accessed based on a Uniform Resource Identifier (URI), also known as an **endpoint**. Resources are nouns (not verbs). You typically use two URIs per resource: one for the collection (`/customers`) and one for the object (`/customers/1234`, where 1234 uniquely identifies a customer.) Resources can also form a hierarchy. For example, the collection of orders of a customer can be identified by the route `/customers/1234/orders`, and an order of that customer can be identified as `/customers/1234/orders/43`.

## Verbs

> To access and manipulate the resources, you use HTTP methods. While resources were nouns, the HTTP methods are verbs that operate on them. They map to CRUD (Create, Read, Update, Delete) operations on the resource.

## Superfluous routes/Excessive nesting

We should avoid routes that have superfluous information, for example he URLs `/articles/101` and `/magazines/42/articles/101` would both route to the same Article. The later of these is superfluous and should be avoided.