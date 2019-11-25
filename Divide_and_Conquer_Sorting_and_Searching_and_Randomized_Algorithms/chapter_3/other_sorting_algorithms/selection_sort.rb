# Selection Sort:
#
# Probably the first touch to sorting algorithms is the bubble sort given its high
# popularity eventhough it was presented in its corresponding file overhere that
#  it didnt performs very well. So following the master question: can we do better?,
# the result is ofcourse we can. Here there is another not surprisingly sorting
# algorithm that runs in O(n^2) as well but is still sigly more efficient than the merge sort.
#
# In this case the procedure is as follow: First find the minimum item in the array pop it
# and start filling (push) the new array with this element. Then repeat the previews step
# until the original array is empty. As you may noticed this algorithm runs in O(n2) space
# which is worst than the bubble sort in that comparision, however, given the pop push process
# of this algorithm in the worst case the algorith will perform n*m operations with m<n. In
# this case m is less than m because the original element is getting reduce in size in n-i
# every iteration reducing the work as the sorting algorithm is approching i --> length(a).
#
# References:
# 1. https://cs.stackexchange.com/questions/13106/why-is-selection-sort-faster-than-bubble-sort
# 2. https://techdifferences.com/difference-between-bubble-sort-and-selection-sort.html
def selection_sort(a)
  new_array = []

  until a.empty? do
    index = 0

    for i in 0..(a.length - 1) do
      min_element = a[i] if i == 0

      if a[i] < min_element
        min_element = a[i]
        index       = i
      end
    end

    a, new_element = pop_k(a,index)

    if new_element
      new_array.push(new_element)
    end
  end

  new_array
end

def pop_k(a,i)
  return a, a.shift       if i == 0
  return a, a.pop         if i == a.length - 1
  return a, "wrong index" if (a == []) || i > (a.length - 1) || (i < 0)

  aux_array = a
  element   = a[i]

  a = a[0..i]
  a.pop
  a += aux_array[i+1..-1]

  return a, element
end

#test
a = (1..10).map{|num| num}.shuffle
p selection_sort(a)
