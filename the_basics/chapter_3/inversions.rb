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

def merge_count_inversions(a, inversions_count)
  return a, 0 if a.length == 1

  half_1 = n.shift
  half_2 = n

  sort_count_left   = sort_count(a, a.length / 2)
  sort_count_rigth  = sort_count(a, a.length / 2)
  merge_split_count = merge_split_count(sort_count_left[:array], sort_count_rigth[:array])

  return merge_count_inversions(
    merge_split_count[:array],
    sort_count_left[:inversions],
    sort_count_rigth[:inversions],
    split_inversions[:inversions])
end

def merge_split_count(half_1, half_2)
  length = half_1.length

  i = 0
  j = 0

  result = {array: [], inversions: 0}

  (2*length).times do |index|
    if i > length - 1
      result[:array][index] = half_2[j]

      next j += 1
    end

    if j > length - 1
      result[:array][index]  = half_1[i]
      result[:inversions]   +=  1

      next i += 1
    end

    if half_1[i] < half_2[j]
      result[:array][index] = half_1[i]

      i += 1
    else
      result[:array][index] = half_2[j]

      j += 1
    end
  end

  result
end

def merge_split_count(half_1, half_2)
  length = half_1.length

  i = 0
  j = 0

  result = {array: [], inversions: 0}

  (2*length).times do |index|
    if i > length - 1
      result[:array][index] = half_2[j]

      next j += 1
    end

    if j > length - 1
      result[:array][index]        = half_1[i]
      result[:inversions] += length - i + 1

      next i += 1
    end

    if half_1[i] < half_2[j]
      result[:array][index] = half_1[i]

      i += 1
    else
      result[:array][index] = half_2[j]

      j += 1
    end
  end

  result
end


def divide(a, n)
  second_half_element = a.pop

  return [a].push(second_half_element) if a.length == n + 0

  return divide(a, n).push(second_half_element)
end

a = [1,2,3,4,5,7,9,8].shuffle
b = [7,4]

c = [4,3,2,1]

def sum(a,b)
  return a+b, a-b
end

# p merge_sort(a)
# p merge_sort(b)
# p merge_sort(c)
