# W4D3 - Auth

## Lecturer: Dallas
### August 24, 2017
### Scribe: Stephen

##Questions
### Presentation

+ In some of the demos they were using before_validation instead of after_initialize. What's the difference and is one better?
  + before_validation executes be This can actually lead to some weird spec bugs depending on which one you use. Prefer after_initialize.

+ How does BCrypt know what the salt is for a given password?
  + It stores that in some way in the user account, or at least some information that allows it to generate the same salt again

+ If we have attr_accessor for password_digest, do we really need self.password_digest?
  + No we don't, it's there for clarity.

+ What is the difference between BCrypt::Password.create vs BCrypt::Password.new?
  + :)

+ Why can't we just compare the salts to each other instead of having this password?
  + not sure

+ Even though the password is never saved to the database, is there any danger if it's assigned to the instance variable?
  + It does get sent to the server as plaintext, so there is a minor danger for the length of the request, but the danger is so minimal as to be basically irrelevant.

+ Why does ensure_session_token use the ||= operator?
  + If I just use =, I would change the session_token every time I make a new object, which could log the user out unintentionally.

+ How do you make sure BCrypt is installed properly?
  + add 'gem bcrypt' to your gemfile

+ What is the purpose of the session_token?
  + So we don't have to log in every time we make a request to the server.

+ Does is_password? need to be named that to work?
  + No, I just named that the same as BCrypt::Password.is_password? for convenience.

+ What does BCrypt store?
  + The salt and the hash.

+ Why use helper_method over something like attr_reader?
  + It helps to control the amount of information your application controller makes available. helper_method is exclusively available to the views.

+ Is session[] a cookie?
  + Yes.

+ What has access to session[]?
  + Anything that inherits from ActiveRecord::Base.

+ If you had helper_method inside of a CatController would that only be accessible in your Cat related views?
  + That's correct.

+ If we want to test our API in Postman, we have to comment out the CSRF protection, but couldn't we just take this auth token and put it into Postman?
  + Only if the token doesn't change for every request, does it? *checks* It does.

+ How does the name value in the html form elements work?
  + Data is stored in a hash named after your model, with the key being the attribute and the value being the input.

### Quiz

+ *NOTE: It's the wrong quiz*

+ Are sessions stored in your browser?
  + Yes, until they are reset.

+ How does Rails destroy the password instance variable?
  + All the User model is, is a shell wrapping the data, like a USB connector to a hard drive(the database). Every time we create a model, we get a new USB adapter and throw it out when we're done. The password is stored in the USB, not the hard drive.
