#Hash table
#The basic idea corresponds to query as fast as an array but with any kind of values called as keys.
#
#To do so an element X that has a key and a value will be stored in an array in a sertain way that
#depends on the key value. To do so a hash function is encharge in translate the key value into an integer
#being it the storing array index.
#
#Data structure:
#  Operations:
#    Insertion, Deletion and Lookup
#
require_relative "dvd_hash"

class HashTable
  def initialize
    @array = Array.new(1000000)
  end

  def add(element)
    index = hash_function(element.key)

    @array[index] = element.val

    element
  end

  def delete(element)
   index = hash_function(element.key)

   @array[index] = nil
  end

  def look_up(key)
    index = self.hash_function(key)

   @array[index]
  end

  def hash_function(key)
    index = []

    key.each_byte{|ascii| index.push(ascii)}

    index.reduce(&:+)
  end
end

#Test
my_table = HashTable.new
p"start"
p name = DvdHash.new("david","mejia")
p "add element"
p my_table.add(name)
p "find element value"
p my_table.look_up("david")
p "delete element"
p my_table.delete(name)
p "find element again"
p my_table.look_up("david")
