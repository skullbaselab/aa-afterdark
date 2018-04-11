## Solutions prep

[Nov cohort:  Fred](./previous_lectures/november2015.md)  
[April cohort: Gigi](./previous_lectures/april2016.md)

## Lecture

**1) Heroku**
+ Partially responsible for the popularity of rails. Really easy to push to production!
+ Puts your app on Amazon servers, does all the messy configuration for you.
+ Now works will all sorts of apps, not just rails!
+ We'll add heroku as a git remote repository and push all our code up.
+ Our git repo doesn't have `node_modules` , `bundle.js` (we gitignored those),data, or gems! So when we clone our repo onto a new computer, we normally do some setup
  + `bundle install` for gems and `npm install` for node modules
  + `webpack` for `bundle.js` and `bundle.js.map`
  + `rake db:migrate` and `rake db:seed` for our database
+ We need to make sure heroku does this setup too!

**2) Heroku setup**
+ Install Heroku toolbelt, which gives you heroku commands in the terminal.
  + you can do this through Homebrew (brew install homebrew) or through direct download (https://toolbelt.heroku.com/)
  + Already on school computers
+ Create an app on heroku.com
  + git url lives under settings
+ Configure your app
  + `gem 'rails_12factor'` so we can see server logs in production
  + Make sure node_modules is in your .gitignore.
  + Add these lines to your package.json:
  ```js
    "engines": {
       // NOTE Your versions of node and npm should go here
       // NOTE Check this by running `node -v` and `npm -v` in the terminal
     "node": "4.1.1", (or whatever your version is)
     "npm": "2.1.x" (ditto)
    },
    "scripts": {
        // NOTE this will make Heroku run "webpack" after it's finished installing node_modules
     "postinstall": "./node_modules/.bin/webpack"
    }
  ```
  + `git remote add heroku` [heroku-git-url-here]
  + `heroku login` (and then enter your credentials)
  + `heroku buildpacks:set heroku/ruby` and `heroku buildpacks:add --index 1 heroku/nodejs` tells heroku to run bundle install AND npm install
+ `git push heroku master`
  + Once you're set up on a computer, this is the only command you'll need.
+ Show errors in `heroku logs -t`
  + Database isn't set up
  + `heroku run bundle exec rake db:migrate`
  + `heroku run bundle exec rake db:seed`

**3) Static Images**
+ Where to put images:
- old way was to put them in Public, which is where 404 page, etc lives.
  - problem: client-side caching. If I put a photo in there,
  then later put in a different photo but give it the same name,
  the browser might have cached that photo by its name and won't load it again.
- solution: fingerprinting! a technique that makes the file name
  dependent on the contents of the file.
  - Now, if I swap out my "luna.jpg"
  picture for another, but name it "luna.jpg" again, the fingerprint on the end of the file name will be different. So the browser will know not to
  use the cached version of the file.
- how do we do it?
  - put photos into `app/assets` and use the Rails helpers (`image_url`, `asset_url`) to generate the URL.
  - Rails view:
   ```html
   <img src=<%=image_url('luna.jpg')%> >`
   ```
  - For use in JS and React:
    ```html
    <!-- application.html.erb -->
      <script type="text/javascript">
        window.lunaURL = <%= image_url('luna.jpg')%>
      </script>
    ```
    ```js
    // your component
      render() {
        <img src={window.lunaURL} />
      }
    ```
  - Background images:  
    `image-url` or `asset-url` in SCSS file
  - then Heroku will place all your fingerprinted assets in `public/assets` folder (by running `bundle exec rake assets:precompile` behind the scenes-- don't run this yourself or it'll cause issues when Heroku runs it). Your `image_url` (erb) and `image-url`(scss) helpers will now point to the fingerprinted URLs

**4) Troubleshooting**
- for rejections on initial push:
  - use Postgres for your db (that's what Heroku uses)
  - add node_modules to your .gitignore
  - make sure git is up to date
  - look at the stack before "push rejected!"
  - could be a syntax error. Heroku is tougher to please than webpack.
- for bugs after initial deploy:
  - run `heroku logs -t` to check out server logs (this is what the gem rails_12factor gives us)
  - `heroku run rails console` will open up Rails console for you to poke around (e.g. Dog.all)
- if you're using rails image helpers (image-url, asset-url) as CSS background, then the file extension has to be .scss
- pushing to your remote git repository ("git push origin master") is totally separate from pushing to heroku ("git push heroku master"). You'll need to do both. When? Minimum at the end of each day, probably more frequently. (Good to keep heroku current, both because that's how the TAs will be assessing your progress, and because sometimes things that worked fine on localhost will not work on heroku, and you 'll need to figure out why!)
