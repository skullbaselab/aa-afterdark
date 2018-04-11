# git_notes.txt

1) git init

2) git config --local user.name "Your Name + Partner Name"

3) git config --local user.email "your@email.com"

4) git add file_name puts file_name in staging area

5) git status (to see what's untracked and what's in the staging area)

6) DO NOT USE -A or . or * UNTIL WE TELL YOU THAT YOU CAN

7) git commit -m "Your message"

8) git diff shows you difference between working directory and staging area

9) Go to github and create new repository

10) git remote add origin(basically name of your url) url

11) git push origin master

# serialization.rb

require 'json'
require 'yaml'

arr = [1,2,3]

json_arr = arr.to_json # => "[1,2,3]" a JSON String

new_arr = JSON.parse(json_arr) # => [1,2,3] a Ruby Array

class Dog
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

doggy = Dog.new("Luna")

# Looks weird "\"#<Dog:0x007ff9b3b0f6f8>\""
json_dog = doggy.to_json

# Does not work
new_dog = JSON.parse(json_dog)

yaml_dog = doggy.to_yaml

# Actually works! gives you a dog with different object id but same attributes
zombie_dog = YAML::load(yaml_dog)
