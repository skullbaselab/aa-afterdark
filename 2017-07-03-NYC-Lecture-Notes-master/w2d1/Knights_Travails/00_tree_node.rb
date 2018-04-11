
# Anything that is defined in a separate file that is necessary for the
# file you are in.
require_relative 'searchable'

class PolyTreeNode
  include Searchable


  attr_accessor :value
  attr_reader :parent

  def initialize(value = nil)
    @value, @parent, @children = value, nil, []
  end

  def children
    # We dup to avoid someone inadvertently trying to modify our
    # children directly through the children array. Note that
    # `parent=` works hard to make sure children/parent always match
    # up. We don't trust our users to do this.
    @children.dup
  end

  def parent=(parent)
    return if self.parent == parent

    # First, detach from current parent.
    if self.parent
      self.parent._children.delete(self)
    end

    # No new parent to add this to.
    @parent = parent
    self.parent._children << self unless self.parent.nil?

    self
  end

  def add_child(child)
    # Just reset the child's parent to us!
    child.parent = self
  end

  def remove_child(child)
    # Thanks for doing all the work, `parent=`!
    if child && !self.children.include?(child)
      raise "Tried to remove node that isn't a child"
    end

    child.parent = nil
  end

  protected
  # Protected method to give a node direct access to another node's
  # children.
  # Underscore is indication to users of our code that this should not
  # be used outside of this class
  def _children
    @children
  end
end
