# Inversions  algorithm:
# The inversions algorithm is a good exampe to introduce the divide and conquer principle very
# useful and famous for in some cases (under some conditions) reach an O(n*lon(n)) runing time.
# This algorithm looks for counting the number of inversions lets say when an element A[i]  of an array
# A is grater than any other element A[j] of the same Array having i < j.
#
# This array can be used to meassure the similarity between two preferences. For example thing about
# in dating. In a dateing app a male or female A will rank its favorites 10 activities defing a profile.
# Then the app will compare his/her profile with the rest of the users and it will try to find
# a suitable pair that probably he/she will match. To do so an inversion algorithm can count the number
# of missmatches that both profiles has creating a matching score. The closest to 0 the score the
# higher probability those two users will match.
#
# Now this algorithm can easly be implemented by brute force using two nested loops what generates
# a running time of O(n ^ 2), as before the next question is Can we do better?
#
# Thanks to the divide and conquer principle and pigging back the merge sort algorithm (if you
# didnt look at it now is a good time to get back and see it) its possible to get an O(n * log(n))
# algorithm
#
# Saying that introduction the implementation is as follows
#
# Input:  array A of n digits
# Output: the number of inversions
#

def sort_count(a, inversions)
  length_a = a.length

  return  a, 0  if length_a == 1

  half_left, half_rigth = divide(a, length_a / 2)

  half_left,  left_count  = sort_count(half_left, inversions)
  half_rigth, rigth_count = sort_count(half_rigth, inversions)

  array, split_count = merge_split_count(half_left, half_rigth)

  inversions = left_count + rigth_count + split_count

  return array, inversions
end


def merge_split_count(half_left, half_rigth)
  length_left  = half_left.length
  length_rigth = half_rigth.length
  length       = length_left + length_rigth

  array      = []
  inversions = 0

  i = 0
  j = 0

  length.times do |index|
    if i > length_left - 1
      array[index] = half_rigth[j]

      next j += 1
    end

    if j > length_rigth - 1
      array[index]  = half_left[i]

      next i += 1
    end

    if half_left[i] < half_rigth[j]
      array[index] = half_left[i]

      i += 1
    else
      array[index] = half_rigth[j]
      inversions  +=  length_left - i

      j += 1
    end
  end

  return array, inversions
end

def divide(a, n)
  return a[0..(n-1)], a[n..-1]
end

a0 = [4,3,2,1,8,7,6,5]
a  = [1,2,3,4,5,7,9,8].shuffle
a1 = (1..3).map{|i| i}.reverse
b  = [7,4]
c  = [4,3,2,1]
book_test =
  [
    54044,
    14108,
    79294,
    29649,
    25260,
    60660,
    2995,
    53777,
    49689,
    9083
   ]
d = [0, 3, 1, 5, 2, 7, 6, 4]

my_file = File.open("inversions_test.txt")
array = my_file.map do |li|
  li.gsub("\n","").to_i
end

p sort_count(array, 0)[1]
