# Quick sort is an algorithm developed by ...
#
# This algorithm is a mix between swaping (tend to remain in O(n) space) and divide and coquer
# technique(leads to O(n(logn)))
#
# Input:         array A of n disctinct elements
# Post proces: ?
# Output:        The same array A sorted
#
# Pseudo code.
# (1) if a length is 1 then return a
# (2) choose a pivot point
# (3) partition the input array in three sections, the first one (partition a)
#     corresponds to the elements less than the pivot element, the
#     second section is the pivot it self and finally the last section
#     (partition c) corresponds to all the elements that are grater than the
#     pivot element.
# (4) recursively quick sort partition a and c
#
#
  def quick_sort(a, l, r)
    return a if l >= r

    p_index = choose_pivot(0, a, l, r)

# swap pivot with the first element

    p_index = partition(a, p_index, l ,r)

    quick_sort(a, l, (p_index - 1))
    quick_sort(a, (p_index + 1), r)
  end

  def partition(a, p, l, r)
    pivot = a[l]
    i     = l

    for k in l..r do
      if a[k] < pivot
        i += 1
        swap_elements(a,i,k) if i != k || k == a.length - 1
      end
    end

    swap_elements(a,l,i)
    i
  end

  def swap_elements(a,j,k)
    aux  = a[j]
    a[j] = a[k]
    a[k] = aux
  end

  def choose_pivot(type, a, l, r)
    l
  end

  def partition_length(index)
    index.map{|num| num}.length
  end

# test:
# basic edge cases
a_sorted = (1..10).map{|num| num}
a_median = [5,1,8,3,6,10,7,9,2,4]
a_reverse = a_sorted.reverse

p "-------------------"
p quick_sort(a_sorted, 0, a_sorted.length - 1)
p "--------------------"
p quick_sort(a_reverse,  0, a_reverse.length - 1)
# "--------------------"
p quick_sort(a_median, 0, a_median.length - 1)
# "--------------------"
p quick_sort(a_sorted.shuffle, 0, a_sorted.length - 1)
