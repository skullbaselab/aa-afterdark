# Week 2 Day 1


Use github!!! Like, really.

Add this to your `.bashrc` (or `.zshrc`) aliases:

```sh
alias be='bundle exec'
```

## YAML (Yet Another Markdown Language)

- Don't forget to include serialization library

```ruby
require 'yaml'
```

Example:
```ruby
c = Cat.new({ name: "Sadie", age: 5, city: "Denver"})
c.to_yaml
#=> serializes the object and returns a string

YAML::load(c.to_yaml)
#=> returns you the cat
```

- Note that proc gets destroyed in the process of serialization.



## JSON (JavaScript Object Notation)
```ruby
c.to_json
#=> returns an object. Not at all useful
```

- It's great for serializing hashes
- Terrible for serializing objects
  - override the default `to_json` method

```ruby
def to_json
  { name: @name, age: @age, city: @city }.to_json
end
```

- To deserialize json use

```ruby
cat_hash = JSON.parse(c.to_json)
#=> returns a ruby hash
```
- json converts ruby symbols into strings.


### How to save a game in Towers of Hanoi
```ruby
def save
  File.open("towers.yml", "w") do |f|
    f.puts self.to_yaml
  end
end
```
