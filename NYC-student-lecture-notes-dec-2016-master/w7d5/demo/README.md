# Frontend Auth

## Backend - What's different
* Models - no changes
* Controllers - nested under API, render json instead of html. No redirecting or 'new' routes.
* Views - Jbuilder instead of ERB

## Front-end
* Treat the current user and errors as a resource like any other
* Form can be shared
* Redirect on success using `withRouter` (or `hashHistory`)
* Protect Routes with `onEnter` hooks

## Fetching the current user on initial load
* Separate request
* Bootstrapping
