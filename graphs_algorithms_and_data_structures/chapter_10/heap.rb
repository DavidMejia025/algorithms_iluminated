require_relative "array_as_b_tree"
# Binary tree node implementation plus BFS and DFS
#
#
class Heap < ArrAsBTree
  attr_accessor :array

  def initialize
    @array = []
  end

  def add(element)
    @array.push(element)

    is_ok?

    @array
  end

  def get
    swap(0, (@array.length) - 1)

    element = @array.pop

    is_ok?

    element
  end

  def is_ok?(heap_position = (@array.length - 1))
    return true if heap_position <= -1

    status, element = element_is_ok? heap_position

    return is_ok?(heap_position - 1) if status == true

    pos_b = self.child_a_pos(heap_position) if element == "child_a"
    pos_b = self.child_b_pos(heap_position) if element == "child_b"
    pos_b = self.parent_pos(heap_position)  if element == "parent"

    swap(heap_position, pos_b)

    return is_ok?(@array.length - 1)
  end

  def element_is_ok? position
    element  = @array[position]
    parent   = self.parent(position)
    children = self.children(position)

    return false, "parent"  unless element >= parent[0]
    return false, "child_a" unless children[0].nil? || children[0] >= element
    return false, "child_b" unless children[1].nil? || children[1] >= element

    return true, nil
  end

  def swap(pos_a, pos_b)
    aux = @array[pos_a]

    @array[pos_a] = @array[pos_b]
    @array[pos_b] = aux

    @array
  end
end

p heap = Heap.new()
p heap.class
p heap.add(6)
p heap.add(1)
p heap.add(2)
p heap.add(3)
p heap.add(10)
p heap.add(5)
p heap.add(6)
p heap.add(7)
p heap.add(8)
p heap.add(9)
p heap
p heap.is_ok?
p heap.add(5)
p heap.get
