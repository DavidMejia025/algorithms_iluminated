# LinkedList data structucture that can be seen as a unidirectional graph where
# each  vertex can have maximum two connections, and all the nodes are
# connected "in-line" .
class BinaryTree
  attr_accessor :root
  def initialize

    @root = nil
  end

  def add(val)
    if @root == nil
      @root = B_tree_node.new(val,nil, nil, nil)
    else
      parent = find_leave(@root, [])
      n_new  = B_tree_node.new(val, parent, nil, nil)

      parent.add(n_new)
    end
  end

  def find_leave(node, queue)
    queue.push(node.l_ref) unless node.l_ref.nil?
    queue.push(node.r_ref) unless node.r_ref.nil?

    while !queue.empty?
      next_node = queue.shift

      return find_leave(next_node, queue)
    end

    return node
  end

  def bfs_tree
    inner_bfs(@root, [], [])
  end

  def inner_bfs(node, bfs, queue)
    bfs.push(node.val)

    queue.push(node.l_ref) unless node.l_ref.nil?
    queue.push(node.r_ref) unless node.r_ref.nil?

    while !queue.empty?
      next_node = queue.shift

      return inner_bfs(next_node, bfs, queue)
    end

    return bfs
  end

  def valueAt(pos)
    find_node_by_pos(self.current, pos, (self.size) - 1).val
  end

  def remove
    leave  = find_leave(@root, [])

    parent = leave.p_ref

    parent.l_ref = nil if parent.l_ref == leave
    parent.r_ref = nil if parent.r_ref == leave

    leave.p_ref = nil
    leave
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

  def count(node)
    return 1 if node.ref == nil

    return count(node.ref) + 1
  end
end

class B_tree_node
  attr_accessor :val, :p_ref, :l_ref, :r_ref

  def initialize(val, p_ref, l_ref, r_ref)
    @val   = val
    @p_ref = p_ref
    @l_ref = l_ref
    @r_ref = r_ref
  end

  def add(node)
    return self.l_ref = node if self.l_ref == nil
    return self.r_ref = node if self.r_ref == nil

    return false
  end

  def val=(val)
    @val = val
  end

  def val
    @val
  end
end

b_tree = BinaryTree.new()

 b_tree.add(4)
p b_tree.root
p b_tree.bfs_tree
p "!!!"
b_tree.add(2)
p b_tree
p b_tree.bfs_tree
p b_tree.root
 b_tree.add(7)
p b_tree
p b_tree.bfs_tree
p b_tree.root
p "?????????"
 b_tree.add(1)
p b_tree
p " !!!!!!!!!!!!!!!! "
 b_tree.add(3)
p b_tree.bfs_tree
p " 22!!!!!!!!!!!!!!!! "
 b_tree.add(5)
p " !!!!!!!!!!!!!!!! "
 b_tree.add(6)
p " $$$$"
p b_tree
p b_tree.bfs_tree
p b_tree.remove
p b_tree
p b_tree.bfs_tree
p " @@@"
p b_tree.bfs_tree
