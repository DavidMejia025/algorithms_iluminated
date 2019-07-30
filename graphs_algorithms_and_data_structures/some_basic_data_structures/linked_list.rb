# LinkedList data structucture that can be seen as a unidirectional graph where
# each  vertex can have maximum two connections, and all the nodes are
# connected "in-line" .
class LinkedList
  def initialize
    @root    = nil
    @current = nil
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
      @current = n_new
    end
  end

  def addAt(pos, val)
    return false if pos < 0 || pos > self.size

    return self.add(val) if pos == self.size

    if pos == 0
      n_new     = Node.new(val,nil)
      @root.ref = n_new
      @root     = n_new
    else
      node          = find_node_by_pos(self.current, pos, self.size - 1)
      new_node_prev = find_node_by_pos(self.current, pos - 1, self.size - 1)

      n_new    = Node.new(val, new_node_prev)
      node.ref = n_new
     end
  end

  def replaceAt(pos, val)
    length = self.size
    return false if pos - 1 > length

    node = find_node_by_pos(self.current, pos, length - 1)

    node.val = val
  end

  def valueAt(pos)
    find_node_by_pos(self.current, pos, (self.size) - 1).val
  end

  def removeAt(pos)
    return false if pos < 0 || pos > self.size - 1

    return self.pop if pos == 0

    if pos == self.size - 1
      poped    = @current.val
      @current = @current.ref
    else
      pop_node      = find_node_by_pos(self.current, pos, length - 1)
      pop_node_next = find_node_by_pos(self.current, pos + 1, length - 1)

      pop_node_next.ref = pop_node_prev
      pop_node.ref      = nil
      poped             = pop_node.val
    end

    return poped
  end

  def find_node_by_pos(node, pos, num)
    return node if num == pos

    return find_node_by_pos(node.ref, pos, num -= 1)
  end

  def pop
    node_n_1 = find_n_1(self.current)

    pop   = @root.val
p @root
    @root = node_n_1
p @root
    @root.ref = nil

    pop
  end

  def find_n_1(node)
   return node  if node.ref == @root

   return find_n_1(node.ref)
  end

  def size
    return 0 if self.current == nil

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

list = LinkedList.new();
list.add('a');
list.add('b');
list.add('d');
p "1111111111"
p list
list.addAt(2, 'c');
p list
p "!!!!"
p list.valueAt(0); #// 'a'

# list.forEach((val, i) => {
#   console.log(`Value at position ${i}: ${val}`);
# });
#
p list.removeAt(0);
p list
