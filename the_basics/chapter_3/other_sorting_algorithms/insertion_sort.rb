# Insertion sort:
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
#
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
      if j == (new_array.length) -1
        new_array.push(shifted_element)
      end
    end

    i += 1
  end

  new_array
end

def reverse_array(a)
  limit = a.length
  sum = 0
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

a  = (1..100).map{|element| element| element}.shuffle
p "start"
p a
p inversion_sort(a)
