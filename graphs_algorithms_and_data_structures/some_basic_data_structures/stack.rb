# Stack data structucture that can be seen as a unidirectional graph where
# each  vertex can have maximum two connections, and all the nodes are
# connected "in-line" .
class Stack
  def initialize(*element)
    @stack = []

    self.add(element[0]) unless element == []
  end

  def show
    @stack
  end

  def add(element)
    @stack.push(element)
  end

  def remove
    @stack.pop
  end

  def find(element)
    result = @stack.find {|node| node == element }

    !result.nil?
  end

  def count
    @stack.length
  end
end

#TDD
p "create stack empty"
q1 = Stack.new()
p valid = q1.show == []
  if valid == false
p   q1.show
  end
p "create stack with one element"
q1 = Stack.new(1)
p valid = q1.show == [1]
  if valid == false
p   q1.show
  end
p "add one element to the stackr"
q1.add(2)
p q1.show == [1,2]
p "remove one element from the stack"
q1.remove
p q1.show == [1]
p "could not find one element in the stack"
p valid = !q1.find(0)
  if valid == false
p   q1.show
  end
p "could find one element in the stack"
p valid = q1.find(1)
  if valid == false
p   q1.show
  end
p "count elements in stack"
p valid = q1.count == 1
  if valid == false
    p    q1.show
  end

#add 3 elements#
#  remove one element
#  add two more elements
#  remove one element
#  search some element
