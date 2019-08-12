require_relative "array_as_b_tree"
# Binary tree node implementation plus BFS and DFS
#
#
class Heap < Arr_b_tree
  attr_accessor :array

  def initialize
    @array = []
  end
# Why this is needed :/




  def is_ok?(position)
    result = true

    10.times do|element|
p      element_is_ok? element
    end
  end
  def element_is_ok? position
p   element  = self.array[position]
p    parent   = self.parent(position)
p    children = self.children(position)

    return false, "parent"  unless element >= parent[0]
    return false, "child_a" unless children[0].nil? || children[0] >= element
    return false, "child_b" unless children[1].nil? || children[1] >= element

    return true, nil
  end
  def swap
  end
end
p heap = Heap.new()
p heap.class
p heap.add(10)
p heap.add(1)
p heap.add(2)
p heap.add(3)
p heap.add(4)
p heap.add(5)
p heap.add(6)
p heap.add(7)
p heap.add(8)
p heap.add(9)
p heap
p heap.is_ok?(9)
