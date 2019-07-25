

# Pseudocode

# (1) Check if result is possible given the rule of max
#     2 swap per element
#     (2) if condition (1) is true
#        continue (3)
#        else retunr -1
# (3) backward induction (BP)
#     (4) if array is equal to initial array return # of swaps
#     (5) else, count the number of possible last moves
#        (6) for each possibility return (go to) (3)
#

a = [1, 2, 3, 4, 5]
a = [2, 1, 5, 3, 4]

(1)
    [2, 1, 5, 3, 4]
    2 => p_0=1 p_1=0
    |p_0|-|p_1| <= 2 => true
    1 => p_0=0 p_1=1
    |p_0|-|p_1| <= 1 => true
 5 => p_0=4 p_1=2
    |p_0|-|p_1| <= 2 => true
    3 => p_0=2 p_1=3
    |p_0|-|p_1| <= 2 => true
    4 => p_0=2 p_1=3
    |p_0|-|p_1| <= 2 => true
 (1) => true

 (1) [2, 5, 1, 3, 4]
    2 => p_0=1 p_1=0
    |p_0|-|p_1| <= 2 => true
    5 => p_0=4 p_1=1
    |p_0|-|p_1| <= 1 => false

 (1) => false

# Write a function called flatten that receives an array of arrays and returns a
# flattened array.



def flatten(a)
  element = a.pop

  return element if a == []

  aux_array = []

  for i in 0..(a.length -1) do
  p a[i]
  p a[i][0].nil?
    if a[i][0].nil?
      aux_array.push(a[i])
      a.delete_at(i)
    end
  end

  return flatten(a) + aux_array
end
p flatten([[1, 2, 3], [4, 5]]) # [1, 2, 3, 4, 5]
#p latten([[[1, [1.1]], 2, 3], [4, 5]]) # [1, 1.1, 2, 3, 4, 5]

