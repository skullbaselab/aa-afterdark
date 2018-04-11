# Full-stack Design Docs Preparation: Component Hierarchy

Now that we are React+Redux wizards, we should turn our gaze to the
future, to our full-stack projects!

Before starting our preparation, let's get our repo ready. Complete
**only** `Phase 1` and `Phase 2` of [these instructions][design-docs] to
create your Design Docs wiki on Github. The homework for the rest of the
Design Docs will be done here.

Take some time to research the site you are cloning. While referring to
your [MVPs][mvps], keep these things in mind:
- What views are required?
- What do those views look like?
- How can these views be broken down into React components? Think
  boxes-in-boxes.
- Which components can be reused in different components?
- What data does each component need to display properly?
  - Does it need a container to `connect` to the store or can the data
    be passed down from a parent as `props`?

[design-docs]: ../../proposal/full-stack-project-proposal.md
[mvps]: ../../proposal/mvp-list.md

Create a rough-draft of your component hierarchy with wireframes
(starting from `App`), which will include drawings of every view and a
list of the needed components (per view). Each component should also
show the data it needs from the redux store.

## Example

Here's an example for _Bluebird_, a Twitter clone.

**NB** Any component ending in `Container` will `connect` its nested
component to the Redux store.

---
# Bluebird Component Hierarchy

## General
+ `App`
  + `NavBar`
  + `MainPage` (all other Components are rendered inside here)
  + `Footer`

## Session Form
+ `SessionFormContainer`
  + `SessionForm`

![session-form](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_session_page.png)

---

## Dashboard / Profile
+ `ChirpIndexContainer` / `ProfileIndexContainer`
  + `ChirpIndex` (can be reused!)
    + `ChirpIndexItem`

![dashboard](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_dashboard_page.png)

---

## Chirp Show
+ `ChirpShowContainer`
  + `ChirpShow`

![chirp-show](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_show_chirp_page.png)

---

## Chirp Form
+ `ChirpFormContainer`
  + `ChirpForm`

![chirp-form](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_chirp_form_page.png)

---

## User Search
+ `UserSearchIndexContainer`
  + `UserSearchIndex`
    + `UserSearchIndexItem`

![user-search](https://raw.githubusercontent.com/appacademy/bluebird/master/wiki/bluebird_user_search.png)
