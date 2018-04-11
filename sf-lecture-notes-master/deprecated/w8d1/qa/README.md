# Redux Design Principles

Note:
### Setup

* Draw Redux loop on board.
* Have sample project proposal open.
* Have demo app open & unsolved.
* Use [Hacker Slides](https://demo.sandstorm.io/appdemo/7qvcjh7gk0rzdx1s3c8gufd288sesf6vvdt297756xcv4q8xxvhh)

---

### We'll answer these questions and more!

* How do I break down components?
* How do I design my store/reducers?
* What APIs do I need?

---

## Design Principles

1. Start with the user.
2. frontend = display, backend = business
3. The Single Responsibility Principle

---

### 1. Start with the user

* Important principle in UX/UI design.
* This means following the Flux arrows _backwards_.

---

### 2. Frontend / Backend

---

* business logic: **relationships, filtering, sorting & ordering**
  * Rails/ActiveRecord/Postgres are _very_ good at this.
  * JavaScript tends to make a mess.
    * exception: mapping

---

* display logic: **Formatting json/model data** so the user can **view**
  and **interact** with it.
  * Rails is _okay_ at this.
  * React is _exceptionally awesome_ at this.

---

* Don't worry about **cacheing**, **pre-fetching**, or **API call
  volume**. Your app isn't near the scale where that matters (just don't
  spam your API).

---

### 3. Single Responsibility Principle

* The "S" in [SOLID Code][solid-code].
* **_One_ object** is responsible for exactly **_one_ thing**.
* single _responsibility_ is different than single _task_
* eg: `ActiveRecord` model

[solid-code]: http://williamdurand.fr/2013/07/30/from-stupid-to-solid-code/#solid-to-the-rescue

---

## How do we apply these principles?

1. Make **view diagrams** first (_User First_).

2. Subdivide views into components based on the **data being displayed**
  (_SRP_).

3. Components will uncritically display whatever's in the store
  (_Frontend/Backend_).

4. Create one reducer for each **data type** (_SRP_).

---

5. The Store will uncritically hold whatever the API gives it
  (_Frontend/Backend_).
  * Exception: reducers can modify the structure.
  * Aside: Object vs. Array

6. One action should be responsible for effecting one unique change in
  the store (_SRP_).
  * This can involve multiple reducers.

7. The API returns pre-filtered data via **query params**
  (_Frontend/Backend_).

8. One action should be responsible for requesting data from the API
  via the middleware & API utils (_SRP_).

---

#### Aside: Object vs. Array

* Object
  * **access, remove, or replace** individual objects from collection
* Array
  * When **order is important** (e.g. most recently updated)
  * If you only access them as a group (`Store.all`)
* Neither
  * A **single object** (e.g. `currentUser`)
* Both
  * Store the objects keyed by id and include an array of just ids.
  * e.g. Normalizr

---

## Examples

---

### The process

1. View diagrams
2. Components
3. Store/Reducers
4. Actions
5. API Endpoints
6. Schema

---

### Try it out

##### simple store - posts index

---

##### nested data - posts & comments

---

##### join table - posts & likes

* fetch join table records?

Note:
- this brings relational logic to the frontend because join records are
  inherently relational

---

* nest user objects?

Note:
- this can result in large response objects that contain a lot of
  duplicated data.

---

**Answer:** start with the user. What info do you actually _need_ to
display? Nest only that.

* simplified user records?
* just usernames?
* like count?
* whether the current user has liked?

---

##### filtered data - posts index & search

---

### Filtering on the Backend

* use `#index` API method
* make a `#search_params` method for simple matching
* use `if` cases for complex matching
* watch out for SQL injection with `#order`
* nest resources (`/users/:id/posts`)

---

### One last example

* posts index/search + user posts

---

### Let's write some code.
