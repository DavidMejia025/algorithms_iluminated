#Test driven development pleaseeeee eventhoug for the algorithms like this
#
# Quick Sort:
#
#
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
p "indexes"
p l
p r
    return a if l >= r

p   p_index = choose_pivot(0, a, l, r)

# swap pivot with the first element
p "result pivot"
   p_index = partition(a, p_index, l ,r)

p "left"
p p_index
     quick_sort(a, l, (p_index - 1))

p "rigth"
p p_index
     quick_sort(a, (p_index + 1), r)
 end

 def partition(a, p, l, r)
p "partion a"
p p
p a
p a[l]
p a[l..r]
   pivot = a[l]
   i     = l
   for k in l..r do
     if a[k] < pivot
       i += 1
       swap_elements(a,i,k) if i != k || k == a.length - 1
     end
   end

   swap_elements(a,l,i)
p "result partition"
p  "i  #{i}"
p  left_array = i == l ? [] : a[l..i-1]
p a[i+1..-1]
p "partiton a"

# return true if a[l] == 4
  i
 end

 def swap_elements(a,j,k)
   aux  = a[j]
   a[j] = a[k]
   a[k] = aux
 end

 def choose_pivot(type, a, l, r)
p "pivot"
p p
p l
p r

   l
 end

 def partition_length(index)
   index.map{|num| num}.length
 end
# test:
# basic edge cases
a_sorted = (1..5).map{|num| num}
a_median = [5,1,8,3,6,10,7,9,2,4]
a_reverse = a_sorted.reverse

p "-------------------"
p quick_sort(a_sorted, 0, a_sorted.length - 1)
p "--------------------"
p quick_sort(a_reverse,  0, a_reverse.length - 1)
# "--------------------"
p quick_sort(a_median, 0, a_median.length - 1)
# "--------------------"
# quick_sort(a_sorted.shuffle, 0, 0, 0)
#
## Partition:
 # input:  array a of n disctint elements,
 # output: index of the pivot point
 #
 #Pseudo Code
 # (1) Set indexes i,j,k equal to 1
 # (2) pass all the array from k = 1 to length a
 #     (3) if a[k] is less than pivot increment.
 #         (4) if j is different from i  swap with the first
 #             element that is grater than pivote that element should
 #             be in j place.
 #         Increase i += 1 and j +=1.
 #     (5) if a[k] is grater than pivote increase j +=1
 #         always move j
 #
 #Manual test
 #  array       i    j
 #  4 3526      1    1
 #  4 35        1    2
 #  4 325       2    3
 #  4 3256      2    4
 #  2 3456      return 2
 #
 #  4 215378    1    1
 #  4 21        2    2
 #  4 215       2    3
 #  4 2135      3    4
 #  4 21357     3    5
 #  4 213578    3    6
 #  3 214578    return 3
