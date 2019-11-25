# input:
#   two n-digit numbers
# output:
#   Multiplication of the input
#
# Constraints:
#   It is allowed only primitive operations
#     * multiply only two numbers of one digit size
#     * sum two one digit number
#     * Can add zeros to the end or at the begining of any of the inputs
#
# Solution #1 using extensibly recursion:
def third_grade_mutiplication(num1, num2)
  num1 = num_to_array(num1)
  num2 = num_to_array(num2)

 # iterate_first_row(num2, num1, []).map(&:join).map(&:to_i).sum
  n_multiplication = iterate_first_row(num2, num1, [])

  n_sum(n_multiplication).join.to_i
end

#[a,b,c,d]
def num_to_array(num)
  next_num = num/10

  return [] if  num == 0

  num_to_array(next_num).push(num%10)
end

def iterate_first_row(row2, row1, zeros)
  num = row2.pop
  zeros.push(0)

  return [] if  num == nil

  return iterate_first_row(row2, row1, zeros*1) << one_row_multiplication(num, row1*1, 0).push(add_zeros(zeros)).flatten
end

def add_zeros(zeros)
  zeros_result = zeros*1
  zeros_result.pop
  zeros_result
end

def one_row_multiplication(num, row, carriage)
  num1 = row.pop

  return carriage > 0 ? [].push(carriage) : []  if  num1 == nil

  single_mult = calculate_carriage(num1 * num + carriage)

  one_row_multiplication(num, row, single_mult[:carriage]).push(single_mult[:result])
end

def calculate_carriage(mult)
  {
    carriage: mult/10%10,
    result:   mult > 9 ? mult%10 : mult
  }
end

def sum_numbers(num1, num2, carriage)
     return carriage > 0 ? [].push(carriage) : [] if num1.empty? && num2.empty?

     if !num1.empty? && !num2.empty?
        iter_sum = num1.pop + num2.pop + carriage
        results  = calculate_values(iter_sum)

        return sum_numbers(num1, num2, results[:carriage]).push(results[:result])
     else
        next_num = num1.pop || num2.pop
        results  = calculate_values(next_num + carriage)

         return sum_numbers(num1, num2, results[:carriage]).push(results[:result])
     end
end

def calculate_values(sum)
    {
      result:   sum%10,
      carriage: sum > 9 ? 1 : 0
    }
end


def n_sum(n)
  sum_1 = n.pop
  sum_0 = n.pop

  return sum_1 unless sum_0

  result = sum_numbers(sum_0, sum_1,0)

  return sum_numbers(n_sum(n.push(result)), sum_numbers(sum_0, sum_1, 0), 0)
end

#Test

num1 = 3141592653589793238462643383279502884197169399375105820974944592
num2 = 2718281828459045235360287471352662497757247093699959574966967627

p n_result = third_grade_mutiplication(num1, num2)


p n_result == num1 * num2

#  cleannig up code movint to Clas version
