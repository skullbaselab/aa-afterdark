## Antipatterns
Using the branch on NinetyNineCats [`horrible-antipatterns`](https://github.com/appacademy/NinetyNineCats/tree/horrible-antipatterns).
Solution is in [`fixed-antipatterns`](https://github.com/appacademy/NinetyNineCats/tree/fixed-antipatterns) branch.

- no model level validations
- writing out the url for form actions
- button_to for get
- queries in views
- not using includes (possibly whiteboard `includes` right now)
  - N+1 queries
- using erb tags in actual ruby code
- not putting html tag attrs in quotes
- nested routes that should be top level
- user_id in hidden field

### Ordering
- try to sign in
  - no current_user helper
  - no logged_in helper
  - auth token broken
  - no reader for password
  - no `save!` in `reset_session_token!`
- try to sign in with bad creds
  - then go to sign up, flash errors will persist
- go to cats index
  - 'get' buttons
  - urls
  - query in view
  - N+1 query
- edit a cat
  - no hidden patch field
  - user_id hidden field
- make a cat with no name
  - no validation for name
