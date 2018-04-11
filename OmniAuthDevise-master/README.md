# OmniAuth/Devise Demo

This is a demo of how to set up an app using devise with omniauth.

Get some keys:
*  [facebook][fb-key]
*  [twitter][tw-key]
*  [github][gh-key]

put them here like this:

```rb
# config/initializers/devise.rb
config.omniauth :facebook, "api id", "app secret"
config.omniauth :twitter, "api id", "app secret"
config.omniauth :linked_in, "api id", "app secret"
config.omniauth :github, "api id", "app secret"
```

[fb-key]:https://developers.facebook.com/apps
[tw-key]:https://dev.twitter.com/apps/new
[gh-key]:https://github.com/settings/applications/new

## Debugging
* warden error?
   * try deleting Gemfile.lock

* bcrypt-ruby error?
   * try `sudo gem install bcrypt-ruby`

