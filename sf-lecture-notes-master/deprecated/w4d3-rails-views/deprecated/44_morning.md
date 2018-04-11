# Content

## ActionMailer
* mailers live in app/mailers
* views for mailers live in app/views/mailer_name
* default from: 'from@example.com'
* call the mail method from the bottom of the mailer
* call the deliver! method from the caller of the mailer action
* attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
* letter_opener `config.action_mailer.delivery_method = :letter_opener`

## View helpers
* link_to
* javascript_include_tag
* put methods in Helper classes
* `helper_method`
 
## View layouts
* review html
* talk about `content_for`
* `<%= yield %>` and `<%= yield :section %>`
* we will talk about the asset pipeline later

## Debugging
* Server Log
* debugger
* better_error
  * `fail` add to controller to break 
* binding of caller
* chrome dev tools

# Projects
## Music App
* retouch on nested routes
* Rebuild Authentication without looking
* use email instead of username
* `Band` records many `Albums`
* `Album` contains many `Track`s.
  * drop down for selecting `Band` talk about belongs_to

* `Track` is a recording on an `Album`.
  * drop down for selecting `Album`
  * ability for regular or bonus track
 
* nested url_helper methods like cats_url(@user, @cat)
* send user email on signup.
  * activation
    * `activation_token` column
    * add `activate` route for users
    * `/users/activate?token=...`
* use `&#9835e` for music notes
* use `<pre>` tags

## Toughest Concepts
*  Doing nested params (keeping pointer of how "deep" you are in the hash).
*  What eval does.
