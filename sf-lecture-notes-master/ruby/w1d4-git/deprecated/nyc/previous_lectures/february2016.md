```ruby
# immortal_cat.rb
require 'yaml'

class ImmortalCat
  attr_reader :name, :color

  def self.load_cat(name)
    YAML.load(File.read(name))
  end

  def initialize(name, color)
    @name, @color = name, color
  end

  def save
    File.write(name, YAML.dump(self))
  end

end
```

# Serialization

The process of putting data into a format that can be parsed by
  both JSON and YAML work by saving the data as a specially formatted string.
Reasons we might want to do this,
  pass data between different programming languages, or across the internet
  store it in a file for later use (if data needs to persist while the program is not running).
  saving a game
  Later we will use a database for this purpose.

# JSON (C C# Java JS Python Ruby etc)
  Javascript Object Notation, a lot like a ruby hash. A subset of valid JS syntax.
  Must be enclosed in a hash or array,
    single values are not valid json.

  Valid data types are numbers, strings, arrays, objects/hashes.
  Custom objects fail (show this), therefore YAML

  http://ruby-doc.org/stdlib-2.0.0/libdoc/json/rdoc/JSON.html
  https://en.wikipedia.org/wiki/JSON

  ########## JSON EXAMPLE #################
  require 'json'

  my_hash = {:hello => "goodbye"}
  json_hash = JSON.generate(my_hash) => "{\"hello\":\"goodbye\"}"
  json_hash = my_hash.to_json => "{\"hello\":\"goodbye\"}"

  my_string = "hello"
  #will error
  json_string = JSON.generate(my_string) => JSON::GeneratorError: only generation of JSON objects or arrays allowed
  #no error, but invalid json.
  json_string = my_string.to_json => "\"hello\""

  ###### Parsing

  JSON.parse(json_hash) => {"hello"=>"goodbye"}
  JSON.parse(json_string) => {"hello"=>"goodbye"}


# YAML (C C# Java JS Python Ruby etc)
  YAML, YAML Aint Markup Language (recursive name!)
  Another strategy for serializing data. Excepts all valid JSON as of the most recent version.
  Also can handle complicated custom data structes (serialize a cat).
  If we bring back zombie cat, it still needs the class Cat

Why do we even use JSON when YAML does everything JSON does?
  Because it is the web standard for data transfer, and widely supportated
  and most of the time we dont need the extra functionality that yaml gives us, so simplicity is good.

  http://ruby-doc.org/stdlib-1.9.3/libdoc/yaml/rdoc/YAML.html
  https://en.wikipedia.org/wiki/YAML

  requiring yaml adds the method to_yaml to every Object (and everything that inherits from object)
  YAML.dump(arg) calls to_yaml on what you pass in.
  YAML.load("yaml") takes a valid yaml formatted string and returns a ruby object

  ########## YAML EXAMPLE ##########
  require 'yaml' # STEP ONE, REQUIRE YAML!
  # Parse a YAML string
  YAML.load("--- foo") #=> "foo"

  # Emit some YAML
  YAML.dump("foo")     # => "--- foo\n...\n"
  { :a => 'b'}.to_yaml  # => "---\n:a: b\n"


  Save cat to file


# GIT

Motivation for why to use git, as projects grow in size, and/or break everything.
Git is a version control system. A way of backing up our data
alternatives are saving full copies periodically
Git solves a lot of problems with previous VCSs and does a lot of other awesome bonus stuff

git tracks your data as commits. Commit are snapshots of your project.
by committing early and often we virtually eliminate the possiblity of losing work or not being able to return to a stable version


How to use git

git init - Creates a new git repo in your current folder, which starts out empty.
git config --local user.name
git config --local user.email
git status
git diff - shows the difference between your current working directory and the previous commit
git add -A, stages all changes shown in the diff.
  this middle step does not actually save your data, it shows you what will be added or removed on the next commit
git commit -m - actual creates the snapshot, before this nothing is saved.
  Use descriptive, imperative language, ideally short. ("Fix bug in readme.")
git log - view your commits

git config - on your machine use git config --global to set your username and password, DO NOT DO THIS ON A/A MACHINES.
  at a/A, use git config --local which is local to your repo, so you have to do it after you git init

Work flow
  def start_project
    git init,
    git config

    loop do
      do work
      git status
      git diff
      git add -A / files
      git status
      git commit -m
      git status
    end

    git push -u origin master
  end

Git and github are totally separate but related things. Github is remote storage for our git repositories

Using Github

Part of what makes git so amazing is how easy it is to back up work to a remote location and collaborate.
Multiple places online host git repos, the most popular is Github.

Create new repo
git add remote url
git remote - to list remotes
git push origin master - use git push to push a specific branch to a remote. For now, the branch will always be master
do another round of changes, then push again.

Show git clone, (why zip is different from clone)
