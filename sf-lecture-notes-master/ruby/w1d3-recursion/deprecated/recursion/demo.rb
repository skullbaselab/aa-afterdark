class MovieGoer
  attr_reader :person_in_front_of_me
  def initialize(person_in_front_of_me = nil)
    @person_in_front_of_me = person_in_front_of_me
  end

  def row_num
    if @person_in_front_of_me.nil?
      1
    else
      @person_in_front_of_me.row_num + 1
    end
  end
end

$count = 0
def shitty_sort(ary)
  $count += 1
  return ary if ary == ary.sort
  shitty_sort(ary.shuffle)
end

def q_s(ary, &blk)
  blk ||= proc{ |el1, el2| el1 <=> el2}
  return ary if ary.length <= 1
  copy = ary.dup
  pivot = copy.pop
  left = []
  right = []
  copy.each do |el|
    if blk.call(el, pivot) == -1
      left << el
    else
      right << el
    end
  end
  q_s(left, &blk) + [pivot] + q_s(right, &blk)
end
