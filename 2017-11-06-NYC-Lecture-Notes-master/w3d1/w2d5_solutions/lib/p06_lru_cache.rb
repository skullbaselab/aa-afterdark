require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  # No & in front of prc, so we're not expecting a block.
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    map.count
  end

  def get(key)
    debugger
    if map[key]
      link = map[key]
      update_link!(link)
      link.val
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + map.to_s + "\n" + "Store: " + store.to_s
  end

  private
  attr_reader :store, :map

  def calc!(key)
    val = @prc.call(key)
    new_link = store.append(key, val)
    map[key] = new_link

    eject! if count > @max
    val
  end

  def update_link!(link)
    link.remove
    new_link = store.append(link.key, link.val)
    map[link.key] = new_link
  end

  def eject!
    rm_link = store.first
    rm_link.remove
    map.delete(rm_link.key)
    nil
  end
end
