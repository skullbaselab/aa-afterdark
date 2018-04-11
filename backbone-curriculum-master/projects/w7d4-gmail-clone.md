# Gmail clone

**TODO**: Finish me!

* Thread
    * Title
* Message
    * Body
* Collections
    * Inbox
    * Archive
    * Starred
* For simplicity, don't do per-message recipients; just record on
  Thread.
* Click reply to add a form for a new message.
* Use `Backbone.Relational` so you don't need to reload the `Thread`
  all the time.

## Bonus

* Subclass `Backbone.Model` to try to use an existing version of an
  object if it isn't too old?
