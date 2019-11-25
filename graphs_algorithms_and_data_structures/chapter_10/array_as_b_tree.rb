class ArrAsBTree
  attr_accessor :array
  def initialize()
    @array = []
  end

  def add(element)
    @array.push(element)
  end

  def children_pos(parent)
    [child_a_pos, child_b_pos]
  end

  def child_a_pos(parent)
    2 * parent + 1
  end

  def child_b_pos(parent)
    2 * parent + 2
  end

  def parent_pos(child)
    return 0  if child == 0

    factor = child.odd? ? (child / 2) : (child / 2) - 1

    child - (child - factor)
  end

  def children(parent)
    [child_a(parent), child_b(parent)].flatten
  end

  def child_a(parent)
    [self.array[child_a_pos(parent)]]
  end

  def child_b(parent)
    [self.array[child_b_pos(parent)]]
  end

  def parent(child)
    [self.array[parent_pos(child)]]
  end
end

#test
a_b_t = ArrAsBTree.new
p a_b_t
a_b_t.add(0)
a_b_t.add(1)
a_b_t.add(2)
a_b_t.add(3)
a_b_t.add(4)
a_b_t.add(5)
a_b_t.add(6)
a_b_t.add(7)

p a_b_t
node = 1
p a_b_t.child_a(node)
p a_b_t.child_b(node)
 p a_b_t.children(node)
nodes = 8.times.map do|num|
  p num
  p a_b_t.parent(num)
end
