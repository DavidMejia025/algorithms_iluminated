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
p    element = self.array[position]
p    parent = self.parent(position)
p    child_a = self.array.children_a(position)
p    child_b = self.array.children_b(position)

result
  end

  def swap
  end
end
p heap = Heap.new()
p heap.class
p heap.add(0)
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
p heap.is_ok?(5)
