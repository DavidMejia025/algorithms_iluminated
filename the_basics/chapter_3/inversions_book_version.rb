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

def sort_count(a)
  length_a = a[:array].length

  return {array: a[:array], inversions: 0}  if length_a == 1

  new_array = divide(a[:array], length_a/2)

  half_left = new_array.shift
  half_rigth = new_array

  sort_count_left   = sort_count({array: half_left})
  sort_count_rigth  = sort_count({array: half_rigth})
  p sort_count_left
  p  hola =      merge_split_count(sort_count_left, sort_count_rigth)

  inversions = sort_count_left[:inversions] + sort_count_rigth[:inversions] + hola[:inversions]

  return {array: hola[:array], inversions: inversions}
  # {
  #   array:     [12] ,
  #   inversions: 1
  #    # ( sort_count_left[:inversions]
  #    #  + sort_count_rigth[:inversions]
  #    #  + hola[:inversions])
  # }
end


def merge_split_count(half_left, half_rigth)
  p half_left
  length = half_left[:array].length

  i = 0
  j = 0

  result = {array: [], inversions: 0}

  (2*length).times do |index|
    if i > length - 1
      result[:array][index] = half_rigth[:array][j]

      next j += 1
    end

    if j > length - 1
      result[:array][index]  = half_left[:array][i]

      next i += 1
    end

    if half_left[:array][i] < half_rigth[:array][j]
      result[:array][index] = half_left[:array][i]

      i += 1
    else
      p half_rigth
      result[:array][index] = half_rigth[:array][j]
      result[:inversions]  +=  length - i

      j += 1
    end
  end
  p result
  result
end

def divide(a, n)
  second_half_element = a.pop

  return [a].push(second_half_element) if a.length == n + 0

  return divide(a, n).push(second_half_element)
end

a0 = [4,3,2,1,8,7,6,5]
a  = [1,2,3,4,5,7,9,8].shuffle
a1 = (1..8).map{|i| i}.reverse
b  = [7,4]
c  = [4,3,2,1]

p sort_count({array: a1, inversions: 0})
