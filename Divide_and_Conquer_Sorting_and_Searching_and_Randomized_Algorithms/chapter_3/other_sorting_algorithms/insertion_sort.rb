# Insertion sort:i
#
# The insertion sort is a common algorithm  that emulates the natural way in which humans
# sort things like a deck of cards. This algorithm improves the bubble sort and the selection
# sort eventhough its running time is O(n^2) as well. In comparison to the bubble sort, insertion sort
# do not swap elements reducing the amount of work of taking an element in the possition i to the position
# i + x where x is the final destination. On the other hand insertion sort improves slection sort in average time
# due to this sorting algorithm is not looking for a particular element such as the minimum avoiding to
# pass through the elements of the initial array in this case only the first element of the base array
# is taken and then compared with the remaining elements in the new array.
#
# input: a n element array (A)
# output: an array with all the elements of A sorted
#
# Pseudo code:
# (1). do steps 2 to 5 until A is depleted
# (2). Shift the first element of A array
# (3). place the shifted element in its corresponding place
#      given that follows the sorted rule.
#      (4). if new array is an empty array pop shifted array,
#      (5). else introduce shifted element where the following
#           rule is accomplished: Shifted element must  be
#           grater than left element and lower that next right
#           element.
#
# References:
# 1. Algorithms to Live By: The Computer Science of Human Decisions
#      Brian Christian, Tom Griffith
#      Henry Holt and Co., Inc. New York, NY, USA ©2016
#      ISBN:1627790365 9781627790369
# 2.https://www.hackerearth.com/practice/algorithms/sorting/insertion-sort/tutorial/
def inversion_sort(a)
  new_array = []
  i         = 0

  until a.empty? do
    shifted_element = a.shift

    if i == 0
      i += 1
      next new_array.push(shifted_element)
    end

    for j in 0..(new_array.length - 1) do
      if shifted_element < new_array[j]
        break new_array.insert(j, shifted_element)
      end

      new_array.push(shifted_element) if j == (new_array.length) -1
    end

    i += 1
  end

  new_array
end

def reverse_array(a)
  limit = a.length
  sum   = 0

  for i in 0..((limit / 2) - 1) do
    left_index  = i
    rigth_index = -1-i

    aux            = a[left_index]
    a[left_index]  = a[rigth_index]
    a[rigth_index] = aux

    sum = 1 if i == 0
  end

  a
end

#test
a  = (1..100).map{|element| element| element}.shuffle
p a
p inversion_sort(a)
