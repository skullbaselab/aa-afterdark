## Gems and rbenv
+ Use rbenv and ruby-build to manage your Rubies
+ Rbenv will also manage gems; other critical gems: rails, bundler, rspec
+ RVM is also popular, but generally more of a hassle
+ Bundler is the most important gem we have

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
