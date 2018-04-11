# How to git yer Rails/React project on the internets using Heroku

### 1. Prepare your project for production

* Remove debuggers and console output.
  * `cmd+shift+F` to search your project for debugger or console statements
* Add the `'rails_12factor'` gem to production group of `Gemfile`
  * This allows us to view Heroku logs and will precompile our assets file
  * **NOTE:** This gem is built into Rails 5, so there is no need to include it if riding Rails 5
* Add `engines` and `scripts` to `package.json`
  * Make sure to use the versions installed on your computer. Use `node -v` & `npm -v` in terminal

  ```js
  // package.json
  ...
    "engines": {
      "node": "4.1.1",
      "npm": "2.1.x"
    },
    "scripts": {
      "postinstall": "./node_modules/.bin/webpack"
    }
   }
   ```
* Execute `bundle install` and `webpack --watch`
  * Make sure everything installed correctly/nothing broke
* Commit changes to master. Remember, we should only push working repos to Heroku.
  * Remember to include `node_modules` and `bundle.js*` in `.gitignore`

  ```sh
  git add Gemfile package.json other_files...
  git commit -m "Prepare for initial Heroku push"
  ```

### 2. Get setup on Heroku

* Create an account on [heroku.com](heroku.com)
* Create a new app
* Setup buildpacks
  * `Settings` tab in Heroku Dashboard
  * Add `heroku/nodejs`, then `heroku/ruby`

### 3. Install the Heroku CLI & push repo

* Install [Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line)
* Login with `heroku login`
  * **NOTE:** if you are switching computers for development you will need to login on each switch, otherwise this should be a one-time action
* Add heroku remote to project repo
  * Follow instructions in `Deploy` tab in Heroku Dashboard
    * You should already have a repo, so use `heroku git:remote -a appname` or `git remote add heroku https://git.heroku.com/appname.git`
* Push to heroku remote: `git push heroku master`
* Setup production database with: `heroku run bundle exec rake db:migrate`
 * Optionally, include seed data with: `heroku run bundle exec rake db:seed`

### 4. (optional) Setup asset pipeline
* Move assets to `app/assets/`
  * Images should be in `app/assets/images`
* Attach assets to the window in `application.html.erb` or `root.html.erb`
* Useful methods
  * [SASS](https://www.sitepoint.com/an-introduction-to-sass-in-rails/)
    * `image-url("rails.png")` returns `url(/assets/rails.png)`
    * `asset-url("rails.png")` returns `url(/assets/rails.png)`
  * JavaScript (access from any JavaScript file included in application.js)
    * `image_path("rails.png")`
    * `asset_path("rails.png")`

### 5. Push your app to heroku right now!
* Do this by end of day
* Add links to your heroku hosted app in your README and to your final project info
  * We will be using these links to assess your progress, so keep them up to date. :smiley-cat:

### Pro tips
* `heroku run ...` run commands just like in terminal
* `heroku open` opens heroku app
* `heroku logs --tail` can view server log live (useful when getting page load errors)

### Common gotchas
* Changing only capitalization when renaming a file. Git will fail to recognize the change. Call over a TA for help.
* Asset pipeline not retrieving an asset, but is looking in the right directory. Assets are only precompiled when the server is restarted, do this.
