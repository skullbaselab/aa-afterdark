# git_notes.txt
Git Commands

1) git init
2) git config --local user.name "Your Name"
3) git config --local user.email "youremail@email.com"
4) git status (check what files are staged, modified, untracked, in working directory, etc.)
5) git diff
6) git branch
7) git checkout branch_name
8) git merge branch_name

# serialization.rb
require 'json'
require 'yaml'
arr = [1, 2, 4]
json_arr = arr.to_json
p JSON.parse(json_arr)

class Dog
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

doggy = Dog.new("Luna")
# doesn't work very well
json_doggy = doggy.to_json
# can't do it
p JSON.parse(json_doggy)


yaml_doggy = doggy.to_yaml
zombie_doggy = YAML::load(yaml_doggy)
p zombie_doggy.name

# different in memory but functionally the same
p doggy.object_id
p zombie_doggy.object_id
