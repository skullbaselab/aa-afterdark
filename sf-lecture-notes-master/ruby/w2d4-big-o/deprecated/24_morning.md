They've never seen modules before this solution and will probably ask about
them. This is a little demo of modules

DEMO:

```ruby
module Meltable
  def melt
    puts "#{ name } is melting"
  end
end
class Snowman
  # add include then  extend Meltable
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
class Witch
  # add include Meltable
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
olaf = Snowman.new("olaf")
elphaba = Witch.new("Elphaba")
olaf.melt
gruntilda.melt
Snowman.melt
Witch.melt
```
# Content
same as chess

# Project
## Checkers
+ talk about `perform_moves`
+ talk about having only one piece class with a king? bool

