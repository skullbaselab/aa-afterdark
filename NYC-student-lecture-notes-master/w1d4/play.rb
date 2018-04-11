require 'json'
require 'yaml'

# this is a non-descriptive variable name
cats = ["chloe", "sennacy", "markov"]

# serialize to json string
stringy_cats = cats.to_json
# p stringy_cats.class

# p JSON.parse(stringy_cats).class

class Cat

  attr_reader :name

  def initialize(name)
    @name = name
  end

end

chloe = Cat.new('chloe')
json_chloe = chloe.to_json # => "\"#<Cat:0x007ffc4c865ba0>\""

# p JSON.parse(json_chloe)

yaml_chloe = chloe.to_yaml
# p yaml_chloe # => "--- !ruby/object:Cat\nname: chloe\n"
zombie_chloe = YAML::load(yaml_chloe) # '::' is specific to class methods (can also use 'YAML.load')
p chloe.object_id
p zombie_chloe.object_id
