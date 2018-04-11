## React JS Tutorial and Guide to the Gotchas
* all stuff from the first day

## Think in React
* start with a mock
* break into a component heirarchy
* identify what has state, and which props are necessary

## Components in Depth
* props
* state
* `onChange` event handlers
* lifecycle methods
* mixins exist

## React on Rails
* `gem 'react-rails', '~> 1.0'`
* `rails g react:install`

## Children
* `this.props.children` gives a component access to its children

## Lecture
* make a rails app, recipes app
* json api
* recipes and ingredients
* add react-rails gem
* install react using generator
* make a recipeindex component and get it rendering
* make a recipe api util
* make a recipe store, give it a addchangehandler and on change and all
* make a sync func that the api util can call
* when recipes index mounts register a change handler and make a fetch
  using util
* get it rendering an array of all recipes, its state
* then make a recipe index item component, state of expanded
