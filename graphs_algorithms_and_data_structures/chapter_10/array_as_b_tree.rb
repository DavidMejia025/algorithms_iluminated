class Arr_b_tree
  def initialize()
    @a_b_t = []
  end

  def add(element)
    self.array.push(element)
  end

  def childrens(parent)
    [children_a(parent), children_b(parent)].flatten
  end

  def children_a(parent)
    children_pos = parent + parent + 1

    [self.array[children_pos]]
  end

  def children_b(parent)
    children_pos = parent + parent + 2

    [self.array[children_pos]]
  end

  def parent(children)
    return [self.array[0]] if children == 0

    factor = children.odd? ? (children / 2) : (children / 2) - 1

    position = children - (children - factor)

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
