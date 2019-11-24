#Implement stack based in node structure
#
#
class Stack
  def initialize
    @root = nil
  end

  def current
    @current
  end

  def root
    @root
  end

  def add(val)
    if @root == nil
      n_new    = Node.new(val,nil)

      @current = n_new
      @root    = n_new

    else
      n_new    = Node.new(val, @current)
      @current  = n_new
    end
  end

  def pop
    pop      = @current.val
    @current = @current.ref

    pop
  end

  def size
    return 0 if self.root == nil

    node = self.current

    count(node)
  end

  def count(node)
    return 1 if node.ref == nil

    return count(node.ref) + 1
  end
end

class Node
  def initialize(val, ref)
    @val = val
    @ref = ref
  end

  def val=(val)
    @val = val
  end

  def val
    @val
  end

  def ref=(ref)
    @ref = ref
  end

  def ref
    @ref
  end
end

s = Stack.new()
p s.size
p s.add(33)
p s.add(10)
p s.add(7)
p s.add(8)
p s.add(75)
p s.root
p s.size
p s.pop
p s.pop
p s.current
p s.root
