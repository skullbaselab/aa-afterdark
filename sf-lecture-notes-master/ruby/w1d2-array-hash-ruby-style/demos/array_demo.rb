# require 'byebug'
#
# def deep_duplication(arr)
#   arr2 = []
#   arr.each do |element|
#     if element.instance_of(Fixnum)
#       arr2 << element
#     elsif element.instance_of(Symbol)
#       arr2 << element
#     else
#       arr2 << element.dup
#     end
#   end
#
#   arr2
# end
