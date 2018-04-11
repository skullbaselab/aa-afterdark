1. props + state - whiteboard (5 mins)
  * There are two ways of making components render content dynamically
    1. props
    2. state
  * The difference between them is where they come from and what you can do with
    them
    * Props come from the parent
    * State comes from inside the component
    * A component can't change its props since it is passed down
    * A component can change its state using `this.setState`
  * General rules
    * Don't create state if you don't have to
    * Don't create state for the same data, move it up the tree
    * Don't create state from props
2. reconciliation - whiteboard (10 mins)
  * Discuss virtual DOM, pairwise-diffing, list diffing
3. lifecycle methods - screencast (10 mins)
  * Demonstrate when all lifecycle methods run for a pre-made click counter demo
  * Explain reconciliation in terms of lifecycle methods
4. Stores - whiteboard ( 10 mins)
  * Explain what stores are useful for
    * Separating the data and data logic from the presentation logic is good
      separation of concerns.
    * Gives us as opportunity down the line to re-use code that is common to all stores
5. rails/react
    1. whiteboard (5 mins)
      * How Rails and React are going to fit together
    2. screencast (40 mins)
      * Given a Rails backend for a Recipes API
        * Show API endpoints
      * Setup a React frontend
        * npm init -f
        * npm install --save webpack babel-core babel-loader babel-preset-react
          babel-preset-es2015 react react-dom
        * Copy webpack config
        * Set path in webpack config
        * Create frontend folder
        * Create main
        * Render into root
        * Create static pages controller
        * Create route for root to static pages
        * Create root div in view
        * Create a recipes component
        * Create a recipe store
          * Addchangehandler
          * OnChange
          * All
          * fetch
          * Fetch recipes on mount

