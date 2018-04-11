# Rails Routes and Controllers

## Rails Server

Run the `rails s` command. Your server will run locally until stopped or
the Terminal session closes.

**NB**: You **must** restart the server after running migrations or
making changes to your app's configuration (Gemfile included). Changes
to model and controller classes are generally safe and don't require a
restart.

## Routing

### Anatomy of an HTTP Request

Open up the Chrome Developer tools to get a sense of what's in a request
object. You can do this through the menu or by pressing CMD + Option + I
(in OS X). Specifically, take a look at:

- General
  - Request Method
  - Request URL
  - Status Code
- Headers
  - Cookie
- Query String Parameters

These are the attributes Rails will look at to determine what happens
with your request.

### Defining Routes

Think of the Rails router as a road map. We tell it the name of our
destination (e.g., "the users index"). It instantiates a Controller and
has it run an action to do the work of getting us there.

Routes go in the `config/routes.rb` file. There are a couple of syntaxes
you can use.

The long way (writing routes by hand gives you more control):

```rb
# http_method "route/matcher", to: "controller_name#action", as: "helper_name"
get "cats/:id", to: "cats#show", as: :cat
```

The short way (resourceful routes):

```rb
# plural resource; `only` and `except` are optional arguments. We prefer `only`.
resources :cats, only: [:show]

# singular resource; skips "index" action, "show" route takes no params
resource :session, only: [:create, :destroy, :new]
```

Note that these two commands generate very different routes. There are
two basic types of routes: **collection** routes and **member** routes.

- Member routes deal with individual instances of a resource.
  - Examples: `show`, `update`, `destroy`
- Collection routes deal with multiple instances of a resource.
  - Example: `index`

Defining a singular `resource` defines only the **member** routes; the
idea is that there is only one member of the resource (remember the
Singleton design pattern). We'll use this later for sign-in and session
management; you may decide to use it for something like a user's `home`
page.

Once we've written our routes, we can view the list by running `rake
routes` in our project directory.

**How to write routes that won't drive you (and consumers of your API)
insane**:

- Don't go crazy with custom router actions; by and large you'll want to
  stick to the default "resourceful" routes that Rails provides. These
  have predictable behavior and are simple to write and organize.
- Opt for simplicity. Only nest routes when you have a **very good
  reason** to do so.
  - This usually won't be the case. Most resources can be uniquely
    identified with a single piece of information (`id`).
  - Nesting an `index` route under another resource is a notable
    exception to this rule.

### URL Helpers

Writing URLs by hand is a chore; Rails saves us from undue suffering by
generating **url helper** methods when resourceful routes are defined.
You'll see the names for these helpers when you run `rake routes`.

- There are two versions of these: `model_url` and `model_path`. For
  boring reasons, we prefer `model_url`.
- Any route with a dynamic segment (like `:id`) must be passed a model
  instance or a value for the dynamic segment.

```rb
cat_url(gizmo.id) # works
cat_url(gizmo)    # also works
cat_url           # fails
```

## Controllers

### Basics

- Lives in `app/controllers`.
- If you write the file yourself, make sure to inherit from
  `ApplicationController`.
- If you generate the file with `rails g controller`, some utility files
  are automatically generated.
  - If you have to delete a controller generated in this way, do it with
    `rails d` and not by just deleting the file.
- Name is always `ModelsController`. Plural, not singular.

### Actions

Typically, these will interact with instances of some model class and
then render a view or perform a redirect. After your controller renders
or redirects, **it dies**. The state of your app does not persist
between requests; information must be stored in either the **database**
or the **cookie**.

**Render XOR redirect**: A controller action must either render content
or redirect to another url, and it must do this exactly once. You can't
render twice, and you can't render **and** redirect: this will raise an
error.

### Params

Params is a Hash-like object that contains information about the
request. The key-value pairs in `params` come from three places:

- The route matching pattern
- The query string
- Form data from a POST, PUT, or PATCH request

Most often, `params` will tell us what object we need to interact with:

```rb
@cat = Cat.find(params[:id])
```

If we're trying to create or update a record, `params` will tell us how
to do that, as well. By convention, the attributes to assign or update
will be a hash nested under `params[:model_name]`, so we could update a
cat like this:

```rb
@cat.update(params[:cat])
```

Through the miracle of mass assignment, Rails will use this hash to
update the database record for `@cat`. But we don't want to allow
changes to **just any** attribute, especially not `id`! So we'll need a
way to filter the params before doing any assignments.

#### Strong Params

The Rails idiom for this whitelisting is to write a "strong params"
method. A typical example:

```rb
def cat_params
  params.require(:cat).permit(:name)
end
```

What does this mean? In essence, take only the parameters that are:

1. Nested under key `:cat`, and
2. Included in the `permit` whitelist.

The returned object will be a hash containing only our allowed params.
