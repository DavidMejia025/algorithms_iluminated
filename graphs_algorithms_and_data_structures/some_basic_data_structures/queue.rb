# Queue data structucture that can be seen as a unidirectional graph where
# each  vertex can have maximum two connections, and all the nodes are
# connected "in-line" .
class Queue
  def initialize(*element)
    @queue = []

    self.add(element[0]) unless element == []
  end

  def show
    @queue
  end

  def add(element)
    @queue.push(element)
  end

  def remove
    @queue.shift
  end

  def find(element)
    result = @queue.find {|node| node == element }

    !result.nil?
  end
end

#TDD
p "create queue empty"
q1 = Queue.new()
p valid = q1.show == []
  if valid == false
p   q1.show
  end
p "create queue with one element"
q1 = Queue.new(1)
p valid = q1.show == [1]
  if valid == false
p   q1.show
  end
p "add one element to the queuer"
q1.add(2)
p q1.show == [1,2]
p "remove one element from the queue"
q1.remove
p q1.show == [2]
p "could not find one element in the queue"
p valid = !q1.find(0)
  if valid == false
p   q1.show
  end
p "could find one element in the queue"
p valid = q1.find(2)
  if valid == false
p   q1.show
  end
#add 3 elements
#  remove one element
#  add two more elements
#  remove one element
#  search some element
