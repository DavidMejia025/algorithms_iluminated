# Merge sort algorithm:
# Sorting is a tipical application of the algoritms, there are a bunch of solutions such as injection sorting,
# buble sorting and more. But why study the Merge Sort algorithm?.
#
# Merge sort algorithm not only performs better than all the other sorting algorithms specially when n grows
# significantly but also is a good example of the divide and conquer principle.
#
# This algorithm was propouse by Jhon Von Neuman back in the 1940s and it is still used as the standard
# sorting algorithim in many programing languages.
#
# The idea behind the solution of this sorting problem is the following.
#
# take an N element array and split into two arrays, for each new array do the same until you reach an array
# of size 1, which means it is sorted. Afterwards you will need to start sorting the upcoming arrays (from
# bottom to top) and merging the result to send back to the previews function call. As you may noticed this
# is a recursive calls pattern where you solve the problem with less elements and then contacatenate their results
# to build the full solution.
#
# Saying that introduction the implementation is as follows
#
# Input: array A of n digits
# Output: array result of the same digits sorted from smallest to largest.
#

def merge_sort(a)
  return a if a.length == 1

  n = divide(a, a.length / 2)

  half_1 = n.shift
  half_2 = n

  return merge(merge_sort(half_1), merge_sort(half_2))
end

def merge(half_1, half_2)
  length = half_1.length

  i = 0
  j = 0

  merged = []

  (2*length).times do |index|
    if i > length - 1
      merged[index] = half_2[j]
      next j += 1
    end

    if j > length - 1
      merged[index] = half_1[i]
      next i += 1
    end

    if half_1[i] < half_2[j]
      merged[index] = half_1[i]
      i += 1
    else
      merged[index] = half_2[j]
      j += 1
    end
  end

  merged
end


def divide(a, n)
  second_half_element = a.pop

  return [a].push(second_half_element) if a.length == n + 0

  return divide(a, n).push(second_half_element)
end

a = [1,2,3,4,5,6,7,8].shuffle
b = [7,4,3,1,0,0,0,0]

c = [4,3,2,1]

p merge_sort(a)
p merge_sort(b)
p merge_sort(c)

