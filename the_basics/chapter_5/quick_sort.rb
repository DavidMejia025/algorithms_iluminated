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
 def quick_sort(a)
   return a if a.length == 0

   choose_pivot(type, a)
# swap pivot with the first element
   partition(a)
   quick_sort(a[0..(l)])
   quick_sort(a[(l+2)..r])
 end

# Partition:
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
 def partition(a)
   pivot = a[0]
   i = 1
   j = 1

   for k in 2..(a.length-1) do
     if a[k] < pivot
       i += 1
       swap_elements(a,i,k) if i != j || k == a.length - 1
     end
   end
   a
   end

 def swap_elements(a,j,k)
   aux  = a[j]
   a[j] = a[k]
   a[k] = aux
 end

 def choose_pivot(type, a)
 end

# test:
a_sorted = (1..10).map{|num| num}
# basic edge cases
a_median = [5,1,8,3,6,10,7,9,2,4]
a_reverse = a_sorted.reverse


p partition(a_sorted)
p "--------------------"
p partition(a_reverse)
p "--------------------"
p partition(a_median)
p "--------------------"
p partition(a_sorted.shuffle)
