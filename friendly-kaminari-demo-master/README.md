#Delayed Job, Kaminari, Friendly Id Demo

##Getting Started
Clone the repo, run the migrations and run `rake db:seed` feel free to create more dogs.

##Delayed Job
Open the rails console, try creating a new dog.
```ruby
Dog.create!(name: "Nom Chompsky", email:"chompsky@dogmail.com")
```
See the delayed_jobs table entry? Cool.

Now go to your directory and run rake jobs:workoff

Hopefully you got an email. Notice how I called 'DogMailer.delay.welcome_email(self)' in Dog's after_create callback.

You can try defining other methods and following them with `handle_asynchronously :method_name`. Try calling them from rails console and then running your worker.

##Friendly Id
Ok, now try going to `localhost:3000/dogs/nom-chompsky`.
Now try going to `localhost:3000/dogs/(insert nom chompsky's primary key here)`.
Check the server logs as you do this and learn things!

NB: Do not be confused by the fact that most of the dogs have ids that are also integers, it was just easier than seeding 1000 dog names. But in any case you probably shouldn't slug a column that's going to be integer values.

##Kaminari
Make sure you seed your database before this part!  

I've implemented a quick little infinite scroll demo using backbone. Go ahead and navigate to the root URL and try scrolling.until you find our good friend Nom.

Check out how `dog_controller.rb` serves its JSON. Then go over to the Dogs Backbone collection and see how parse handles that. From there, check out the index View and how I set up the scroll listener. Take note that you would want to remove this listener from the window if you were to have other views, conveniently for me we don't. Underscore's throttle method serves a useful purpose here, look up what it does and try to see what happens if you don't use it. Also, pay particular attention to the options on the fetch method and what they're doing.
