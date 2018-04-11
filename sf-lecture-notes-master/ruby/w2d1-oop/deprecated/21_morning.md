# Content

## Practice assessment
+ Questions
+ Byebug

## Git
+ Create a local repo
  - git init
  - git status
  - git add . vs git add -A
  - git rm --cached <file>
  - git commit -m "message"
  - git log
  - git branch && git checkout -b <branch-name>
  - git diff
+ Create a remote repo
  - git push
  - git pull
+ Alias commands
+ Call a TA over if you have problems
+ Check out the authorship rewrite script to put the commits on your account

## Gems and rbenv
+ Use rbenv and ruby-build to manage your Rubies
+ Rbenv will also manage gems; other critical gems: rails, bundler, rspec
+ Bundler is the most important gem we have
+ RVM is also popular, but generally more of a hassle

## Serialization (JSON and YAML)
+ The process of converting ruby object to a format that is good for storing or sending over the network
+ Common formats: JSON and YAML
+ Demo adding saving with yaml to Towers of Hanoi
+ Use the best gem in the world, debugger to solve the assessment

**DEMO**:
```ruby
# JSON
Cat.new("Breakfast", 8, "San Francisco").to_json
JSON.parse('{"a":"always","b":"be","c":"closing"}')
# YAML
c = Cat.new("Breakfast", 8, "San Francisco")
serialized_cat = c.to_yaml
YAML::load(serialized_cat)

File.open('cat.yml', 'w') do |f|
  f.puts c.to_yaml
end
YAML.load_file('cat.yml')
```

# Project
## Minesweeper
