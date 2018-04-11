
## Agenda

+ Frontend Auth questions (10 min)
+ Google Maps Integration (10 min)
+ Backend filtering (10 min)
+ Thinking in React Recap (10 min)
+ Yesterday's Project (10 min)
+ Homework (5 min)
+ Quiz (5 min)

---

### Frontend Auth Questions

+ `SessionReducer`
+ action creators / API utils
+ frontend routing
+ bootstrapping current user

Note:
sessionReducer default state:
const _nullUser = {
  currentUser: null,
  errors: []
};

onEnter hooks:
onEnter={ _redirectIfLoggedIn }
onEnter={ _ensureLoggedIn }

bootstrapping backend:
<script type="text/javascript">
  <% if logged_in? %>
    window.currentUser =
      <%= render("api/users/user.json.jbuilder", user: current_user).html_safe %>
  <% end %>
</script>

bootstrapping frontend:
if (window.currentUser) {
    const preloadedState = { session: { currentUser: window.currentUser } };
    store = configureStore(preloadedState);
} else {
    store = configureStore();
}
---

### Google Maps Integration

Note:
show google maps demo (in email)

---

### Filtering on the Backend

* use `#index` API method
* make a `#search_params` method for simple matching
* use `if` cases for complex matching

Note:
demo w8d1_demos backend (in email)
---

### Thinking in React

+ start with a mockup
+ build a static set of components
+ identify UI state
+ build Redux cycle/s around this UI state

Note:
Jenn talked about this process on Friday afternoon
show demo of this - draw mockup, show static components, start to build Redux cycle
---

## Homework

[homework](https://github.com/appacademy/curriculum/tree/master/full-stack-project/homeworks/ux)

Note:
show real sites and talk briefly about their splash pages / login pages?
---

## Quiz

[quiz](https://github.com/appacademy/daily-quiz/blob/master/react/w8d1.md)

---
