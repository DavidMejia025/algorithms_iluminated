# LinkedList data structucture that can be seen as a unidirectional graph where
# each  vertex can have maximum two connections, and all the nodes are
# connected "in-line" .
class LinkedList
  def initialize
    @root    = nil
  end

  def add(val)
    if @root == nil
      n_new = Node.new(val,nil)

      @root = n_new
    else
      n_new = Node.new(val, nil)

      last_node = find_last_node(@root)

      last_node.ref = n_new
    end
  end

  def find_last_node(node)
    return node if node.ref == nil

    find_last_node(node.ref)
  end

  def addAt(pos, val)
    return false if pos < 0 || pos > self.size

    return self.add(val) if pos == self.size

    if pos == 0
      node      = find_node_by_pos(self.root, 0, 0)
      n_new     = Node.new(val, node)
      @root     = n_new
    else
      node          = find_node_by_pos(self.root, pos, 0)
      new_node_prev = find_node_by_pos(self.root, pos - 1, 0)

      n_new             = Node.new(val, node)
      new_node_prev.ref = n_new
    end
  end

  def replaceAt(pos, val)
    length = self.size

    return false if pos - 1 > length

    node = find_node_by_pos(self.root, pos, 0)

    node.val = val
  end

  def valueAt(pos)
    find_node_by_pos(self.root, pos, 0).val
  end

  def removeAt(pos)
    return false if pos < 0 || pos > self.size

    if pos == self.size
      last_node     = find_node_by_pos(self.root, pos - 1, 0)
      new_last_node = find_node_by_pos(self.root, pos - 2, 0)

      new_last_node.ref = nil

      poped =  last_node.val
    elsif pos == 0
      new_root = find_node_by_pos(self.root, 1, 0)

      pop_element = @root
      pop_element.ref = nil

      @root = new_root

      poped =  pop_element.val
    else
      pop_node      = find_node_by_pos(self.root, pos, 0)
      pop_node_next = find_node_by_pos(self.root, pos + 1, 0)
      pop_node_prev = find_node_by_pos(self.root, pos - 1, 0)

      pop_node_prev.ref = pop_node_next
      pop_node.ref      = nil
      poped             = pop_node.val
    end

    return poped
  end

  def find_node_by_pos(node, pos, num)
    return node if num == pos

    return find_node_by_pos(node.ref, pos, num += 1)
  end

  def find_n_1(node)
   return node  if node.ref == @root

   return find_n_1(node.ref)
  end

  def size
    return 0 if self.root == nil

    node = self.root

    count(node)
  end

  def count(node)
    return 1 if node.ref == nil

    return count(node.ref) + 1
  end

  def root
    @root
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
p "Add some items to the list:"
puts
list.add('a');
list.add('b');
list.add('c');
list.add('d');
p "Show list:"
p list
p "Add another element:"
list.addAt(2, 'e');
p "Show list:"
p list
p "Show first element:"
p list.valueAt(0); #// 'a'
p list.size
p "Remove the first element"
p list.removeAt(3);
p "Show list"
p list
