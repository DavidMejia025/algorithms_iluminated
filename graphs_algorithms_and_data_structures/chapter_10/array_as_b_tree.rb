class Arr_b_tree
  def initialize()
    @a_b_t = []
  end

  def add(element)
    self.array.push(element)
  end

  def children(parent)
    [child_a(parent), child_b(parent)].flatten
  end

  def child_a(parent)
    child_pos = parent + parent + 1

    [self.array[child_pos]]
  end

  def child_b(parent)
    child_pos = parent + parent + 2

    [self.array[child_pos]]
  end

  def parent(child)
    return [self.array[0]] if child == 0

    factor = child.odd? ? (child / 2) : (child / 2) - 1

    position = child - (child - factor)

    [self.array[position]]
  end
end
#
#a_b_t = Arr_b_tree.new
#p a_b_t
#a_b_t.add(0)
#a_b_t.add(1)
#a_b_t.add(2)
#a_b_t.add(3)
#a_b_t.add(4)
#a_b_t.add(5)
#a_b_t.add(6)
#a_b_t.add(7)
#
#p a_b_t
#node = 1
#p a_b_t.children_a(node)
#p a_b_t.children_b(node)
# p a_b_t.childrens(node)
#nodes = 8.times.map do|num|
#  p num
#  p a_b_t.parent(num)
#end
