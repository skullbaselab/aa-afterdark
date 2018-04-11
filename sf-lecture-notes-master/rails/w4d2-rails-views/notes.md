### Lecture Improvement
* Clean up Recipe App Demo a bit to assure no unnecessary code
* Don't rush the end of the lecture. Make sure to talk about debugging.

### HTML
* Semantic HTML is just choosing the right tag for the job.
* Containers are ways to hold blocks of html elements so we can target them all at once instead of individually.

### URI
* A URI is a string of characters representing a resource
* Most common form of URI is the URL
* A URL identifies a web resource & specifies the means of acting upon or obtaining the representation of it
* `http://www.example.org/w4d2/index`
    - URI: w4d2/index
    - URL: declares data type as html available through HTTP from example.org

### PUT vs PATCH
* Use patch throughout the course but know that PUT
* PUT is used to replace an entire resource
* PATCH is used to modify a resource

### PARAMS
* 3 ways to pass values into Params hash
    - Route Params
    - Query String
    - Request Body
* We use `#require` to fail if paramter is not provided
* We use `#permit` to fail if parameter is given that is not permitted

### W4D1
* Validations allow you to ensure that only valid data is stored in your database.
* Callbacks and observers allow you to trigger logic before or after an alteration of an object’s state.
* Database constraints and/or stored procedures make the validation mechanisms database-dependent
* Client-Side validation less secure
* Some rails methods skip validations like `update` vs `update_attributes`

### HTML Forms
* forms main purpose is for client to input data
* action is destination for the request
* remember semantic html and accessability

### URL Helpers
* Rake routes! Use the prefix to get an idea of what the url_helper should be
* We use url_helpers because they are easier to maintain and debug

### Rails Forms
* Rails wants to make key value pairs for params using `name` attributes
* nest using `cat[favorite_color]`
* nest params because we might want to create multiple kinds of objects
* can specify put, patch delete using hidden fields

### Basic Views
* controller can `redirect_to` or `render`, both populate a response
* request comes in response goes out
* imagine a letter and a response
* response is usually an html document for browser to render
* rails views are templates (like madlibs), when we `render` template is
  evaluated
* instance vars are available in the template, even though scope is
  different
* double render error, can't respond to the same request twice
* **render doesn't return**
* redirect puts instruction in the response to make a subsequent request

### Templates (ERB)
* `<% ruby.code.goes.here %>`, and `<%= more.code %>` evaluate ruby code
* `puts` will print to the server console, `<%= %>` with return values
* comment out with `<%#= %>`
* Minimize logic in views because it is harder to maintain
* It is the job of the view only to present data, not manipulate it
* Helper methods for views: `link_to` & `button_to`
* `button_to` generates a `<form>` and link_to generates an `<a>`

### Debugging
* Server logs
* `better_errors`, `binding_of_caller` and failing loudly
* `byebug`

[June cohort:  Gigi](./previous_lectures/june2016)  
[Aug cohort: Maurice](https://github.com/appacademy/twitter-august2016/tree/w4d2)

## Solutions prep

**Expect questions on:**
+ A03 Solutions   


**Point out:**
+ Validating/constraining one column in scope of other column (ContactShare)
+ Validating association instead of foreign_key: ensures that the associated object actually exists in the database (will run a query)
+ Contacts #index action: Put most of logic in the model
+ Nested routes: Only need to nest :index action for contacts
  + If you really wanted to have a non-nested 'index' page, you could make a custom route, e.g. `contacts/all`

## Lecture

**1) Params Review**
+ Ensure everyone knows what to expect from `params` with various requests
+ Challenge questions?

**2) Redirect**
+ Render is NOT the only way to finish a response.
+ `redirect_to` 'http://wikipedia.org'
  + Network tab: first request has a response 302, response location header
  + Second request to wikipedia!
+ Also can redirect with rails url helpers (show rake routes)
  + The left column (prefix) is blank sometimes because several routes share the same URL
+ Double render errors -- show error message

**3) Views**
+ `render :template` will look in specific directory for a html file, and render that within `layouts/application.html.erb`
+ Comment out js/css for now. It just clutters up server logs now.
+ Do basic ruby in a view, show that it's NOT in the response with `View Page Source`
  + ERB gets interpreted before response is sent back to client
  + `<=% 1 + 2 %>` -- becomes '3' in the response
+ Write out index view

**4) Forms/Partials**
+ A form has 1) action and method 2) input fields 3) submit
+ New view: Start with skeleton, fill in necessary bits
  + Tip: If you need to enter user_id or something, use `User.ids` as a placeholder in your input box
  + Two ways of making labels
+ Create stuff!
  + Render errors in `<ul>` (maybe have this commented out ahead of time)
+ Edit form
  + Refactor to share partial with edit/new

**5) Buttons**
+ Every button is a mini form: 1) action and method 2) input 3) submit
+ Delete button
