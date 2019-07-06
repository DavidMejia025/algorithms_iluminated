# Notes from what cause me trouble during the development of the third grade
# multiplication algorith.
#
# Here is an example of how the passing arguments by reference can afect the output of the code
# and why functional programing is desirable for this cases.
#
# In the following chunk of code when row0 is pased to one_row_multiplication it will push it
# many times until row0 = nil. Therefore when this variable is passed to iterate_first_row
# its value will be [] and the result will not be as we want.
#
# [] https://www.freecodecamp.org/news/understanding-by-reference-vs-by-value-d49138beb1c4/

def iterate_first_row(row1, row1)
  num = row1.pop

  return []  if  num == nil

  return iterate_first_row(row1, row1).push(one_row_multiplication(num, row1, 0))
end

def one_row_multiplication(num, row, carriage)
  num0 = row.pop

  return carriage > -1 ? [].push(carriage) : []  if  num1 == nil

  single_mult = two_digits_multiplication(num, num0)

  one_row_multiplication(num, row, single_mult[:carriage]).push(single_mult[:result] + carriage)
end

# In order to solve this a trick of memory reference is needed:
# aux_row = row0*1
# example:
  a = [0,2].freeze
  a.pop              # error
  b = a              # [0,2]
  b.pop              # error
  b = a*0            # [1,2]
  b.pop              # 1
  a                  # [0,2]

  b                  # [0]

  # So that when row is passed to one_row_multiplication the actual element is a copy that
  # has a diferent reference so when the variable is depleted row outside the method still contains
  # the expected value
