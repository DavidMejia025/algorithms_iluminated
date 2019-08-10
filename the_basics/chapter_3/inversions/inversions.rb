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
# additional references:
# 1. https://www.geeksforgeeks.org/counting-inversions/
# 2. https://www.hackerrank.com/challenges/ctci-merge-sort/problem

def merge_count_inversions(a)
  return {array: a[:array], inversions: 0} if a[:array].length == 1

  half_1, half_2 = divide(a[:array], a[:array].length / 2)

  return merge_split_count(
    merge_count_inversions({array: half_1, inversions: a[:inversions_count]}),
      merge_count_inversions({array: half_2, inversions: a[:inversions_count]}))
end


def merge_split_count(half_1, half_2)
  length_left  = half_1[:array].length
  length_rigth = half_2[:array].length
  length       = length_left + length_rigth

  i = 0
  j = 0


  result = {array: [], inversions: half_1[:inversions] + half_2[:inversions]}

  length.times do |index|
    if i > length_left - 1
      result[:array][index] = half_2[:array][j]

      next j += 1
    end

    if j > length_rigth - 1
      result[:array][index]  = half_1[:array][i]

      next i += 1
    end

    if half_1[:array][i] < half_2[:array][j]
      result[:array][index] = half_1[:array][i]

      i += 1
    else
      result[:array][index] = half_2[:array][j]

      result[:inversions]  +=  length_left - i

      j += 1
    end
  end

  result
end

def divide(a, n)
  return a[0..(n-1)], a[n..-1]
end


# def divide(a, n)
#   p a.length
#   second_half_element = a.pop
#
#   return [a].push(second_half_element) if a.length == n + 0
#
#   return divide(a, n).push(second_half_element)
# end


a0        = [4,3,2,1,8,7,6,5]
a         = [1,2,3,4,5,7,9,8].shuffle
a1        = (1..8).map{|i| i}.reverse
b         = [7,4]
c         = [4,3,2,1]
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
p book_test.length
p "divide"
p book_test
# divide(book_test, book_test.length/2)
p "-------------"

# sorted_array = (1..5).map{|element| element}.reverse
# sorted_array = book_test
# sorted_array.count
# num          = sorted_array.count
# base         = Math.log(num,2).to_f.ceil
# dif          = (2 ** base) - num
# #sorted_array = sorted_array.sort
# add_zeros    = (1..dif).map{|z| -z}.reverse
# p sorted_array
# sorted_array =  add_zeros+sorted_array
# #sorted_array +=  add_zeros
# p sorted_array
# array = sorted_array
# p array.count
# "theorical num of inversions"
# array = (1..16).map{|num| num}.reverse
# array.length * ((array.length) -1) / 2
#p array = [4,5,1,2,3]
#p divide(array, array.length/2)
# merge_count_inversions({array: array, inversions: 0})
my_file = File.open("inversions_test.txt")
array = my_file.map do |li|
  li.gsub("\n","").to_i
end

p array.length
# "Reat test"
# num        = array.count
#  "theorical num of inversions"
# array.length * ((array.length) -1) / 2
# merge_count_inversions({array: array, inversions: 0})
# "real test result"
p merge_count_inversions({array: array, inversions: 0})[:inversions]
#
