# Algorithms are usually used for improve the calculation of different matematical operations, and
# there is a hole field in maths for that named as numerical analysis. One key operation that must
# be done in linear algebra for different purposues is the matrix multiplication. The basic
# algorithm to compute the multiplication of two matrices is equal to the dot product of them,
# Z =  A · B  each one of size nxn.
# The new matrix will be compouse by nxn products calculated as follows
#
# Z_{i,j} = sum_{i = 1}^{n}  A[i,k] * B[j,k]
#
# input: A matrix nxn denoted as A = [ [a_{1},.., a_{n}]_{1}, [a_{1},.., a_{n}], ...,  [a_{1},.., a_{n}]_{n}] where [[x]]
# x is one row of the matrix.
# input: A matrix nxn denoted as B = [ [b_{1},.., b_{n}]_{1}, [b_{1},.., b_{n}], ...,  [b_{1},.., b_{n}]_{n}] where [[x]]
# x is one row of the matrix.
#
# output: a matrix Z  Z = [ [z_{1,1},.., z_{1,n}], [z_{2,1},.., b_{2,n}], ...,  [b_{n,1},.., b_{n,n}]]
#
def matrix_multiplication_brute_force(a, b)
  matrix_length = a.length

  result     = []
  row_k      = []
  element_ij = 0

  for k in 0..matrix_length -1 do
   for i in 0..matrix_length - 1 do
     for j in 0..matrix_length - 1 do
       element_ij += a[i][j] * b[j][i]
     end
     row_k.push(element_ij)
     element_ij = 0
   end
     result.push(row_k)
     row_k = []
  end

  result
end

a = [[1,2,3], [1,2,3], [1,2,3]]
b = [[3,5,2], [4,5,2], [6,7,8]]

matrix_multiplication_brute_force(a,b)

# Once the intuition drives to the brute force algorithm you may notice that this algorithm takes O(n^3) which means is not
# very good, then the magic question "Can we do better" yes, and there is a famous algorithm called Strassens agorthim
# thanks to the professor Volker strassen who publish the following algorithm in 1969 and proves that there is a way to reduce
# the 8 number of basics operations to compute a 2x2 matix. This idea then suggest that if an nxn matrix can be divided and
# recursively computed somehow as a 2x2 matrix the strassen algorithm will solve the nxn problem. Indeed this is a divide
# and conquer algorithm and how the strassen algorithm works.
#
# In order to uderstand better the recursion behind the strassen algorithm the next example is an implementation of a matrix
# multiplication following the divide and conquer principle, not yet the strassen solution. What needs to be taken into
# account is that an nxn matrix can be splited into 4 n/4 x n/4 matrices, and this porces can be done until you get a 2x2
# matrix that requires 8 operations each.
#

def rec_matrix_multiplication(a, b)
  matrix_length = a.length

  return a[0] * b[0] if matrix_length == 1

  a_splited = split_matrix(a, matrix_length)
  b_splited = split_matrix(b, matrix_length)

  a_b_1 = [matrix_sum(rec_matrix_multiplication(a_splited[0], b_splited[0]), rec_matrix_multiplication(a_splited[1], b_splited[2]))].flatten
  a_b_2 = [matrix_sum(rec_matrix_multiplication(a_splited[0], b_splited[1]), rec_matrix_multiplication(a_splited[1], b_splited[3]))].flatten
  a_b_3 = [matrix_sum(rec_matrix_multiplication(a_splited[2], b_splited[0]), rec_matrix_multiplication(a_splited[3], b_splited[2]))].flatten
  a_b_4 = [matrix_sum(rec_matrix_multiplication(a_splited[2], b_splited[1]), rec_matrix_multiplication(a_splited[3], b_splited[3]))].flatten

  row_length = a_b_1.count

  if row_length == 1
    result = [ [a_b_1[0],  a_b_2[0],  a_b_3[0] , a_b_4[0]] ]
  else
    result = (
      [
        a_b_1[0..(row_length / 2) - 1] + a_b_2[0..(row_length / 2) - 1] +
        a_b_1[(row_length / 2).. - 1]  + a_b_2[(row_length / 2).. - 1]  +
        a_b_3[0..(row_length / 2) - 1] + a_b_4[0..(row_length / 2) - 1] +
        a_b_3[(row_length / 2).. - 1]  + a_b_4[(row_length / 2).. - 1]
      ]
    )
  end

  build(result[0], result[0].length)
end

def build(n, length_n)
    n_x_n = []
    row   = []
    k     = 0

    for i in 0..(length_n ** (0.5) - 1)
      for j in 0..(length_n ** (0.5) - 1)
        number = n.shift
        row.push(number)
      end
      n_x_n.push(row)

      row = []
    end

    n_x_n
end


def matrix_sum(x,y)
  return x + y if x.class == Fixnum

  length_x   = x.length
  length_x_i = x[0].length

  result   = []
  sum      = []

  for k in 0..length_x - 1 do
    for j in 0..length_x_i - 1 do
      sum.push(x[k][j] + y[k][j])
    end

    result.push(sum)

    sum = []
  end

  result
end

def split_matrix(x, length)
  middle_length  = length / 2

  upper_matrices = x[0..middle_length - 1]
  lower_matrices = x[middle_length.. - 1]

  result = [[],[], [], []]

  if upper_matrices.length == 1
    result[0].push(upper_matrices[0][0])
    result[1].push(upper_matrices[0][1])
    result[2].push(lower_matrices[0][0])
    result[3].push(lower_matrices[0][1])

    return result
  end

  result[0].push(upper_matrices[0][0..middle_length -1]).push(upper_matrices[1][0..middle_length -1])
  result[1].push(upper_matrices[0][middle_length..-1]).push(upper_matrices[1][middle_length..-1])
  result[2].push(lower_matrices[0][0..middle_length -1]).push(lower_matrices[1][0..middle_length -1])
  result[3].push(lower_matrices[0][middle_length..-1]).push(lower_matrices[1][middle_length..-1])

  return result
end

 # Once the recursion multiplication is done again the key question emerges again, Can we do better?. And the answer is yes, taking into
 # accout the previeus experience with the two n digit integeres multiplication where a math trick from a gauss expressin helped Karatsuma
 # to improve that algoritm, Prof strassen also came out with an tricky aproach to recursively solve the matrix multiplication problem.
 # In this case the algorithm will split the original matrix in 4th matrices but the equation to conquer the solution will be as follows:
 #

  def strassen_matrix_multiplication(a, b)
    matrix_length = a.length

    if matrix_length > 1
      a_splited = split_matrix(a, matrix_length)
      b_splited = split_matrix(b, matrix_length)
    else
      a_splited = a.map {|item| item[0]}
      b_splited = b.map {|item| item[0]}
    end

    p1 = calculate_p1(a_splited, b_splited)
    p2 = calculate_p2(a_splited, b_splited)
    p3 = calculate_p3(a_splited, b_splited)
    p4 = calculate_p4(a_splited, b_splited)
    p5 = calculate_p5(a_splited, b_splited)
    p6 = calculate_p6(a_splited, b_splited)
    p7 = calculate_p7(a_splited, b_splited)

    build_new_matrix(p1, p2, p3, p4, p5, p6, p7)
  end
  
  def build_new_matrix(p1, p2, p3, p4, p5, p6, p7)
    if p1[0].class == Fixnum
      a_b_1 = p5[0] + p4[0] + (-1 * p2[0]) + p6[0]
      a_b_2 = p1[0] + p2[0]
      a_b_3 = p3[0] + p4[0]
      a_b_4 = p1[0] + p5[0] + (-1 * p3[0]) + (-1 * p7[0])

      return [[a_b_1,  a_b_2],  [a_b_3 , a_b_4]]
    else
    # p a_b_1 = [matrix_sum(matrix_sum(p5, p4), matrix_sum((-1 * p2), p6))].flatten
    # p a_b_2 = [matrix_sum(p1, p2)].flatten
    # p a_b_3 = [matrix_sum(p3, p4)].flatten
    # p a_b_4 = [matrix_sum(matrix_sum(p1, p5), matrix_sum((-1 * p3), (-1 * p7)))].flatten
      # [
      #   a_b_1[0..(row_length / 2) - 1] + a_b_2[0..(row_length / 2) - 1] +
      #   a_b_1[(row_length / 2).. - 1]  + a_b_2[(row_length / 2).. - 1]  +
      #   a_b_3[0..(row_length / 2) - 1] + a_b_4[0..(row_length / 2) - 1] +
      #   a_b_3[(row_length / 2).. - 1]  + a_b_4[(row_length / 2).. - 1]
      # ]
    end
  end

  def build(n, length_n)
      n_x_n = []
      row   = []
      k     = 0

      for i in 0..(length_n ** (0.5) - 1)
        for j in 0..(length_n ** (0.5) - 1)
          number = n.shift
          row.push(number)
        end
        n_x_n.push(row)

        row = []
      end

      n_x_n
  end


  def matrix_sum(x,y)
    return x + y if x.class == Fixnum

    length_x   = x.length
    length_x_i = x[0].length

    result   = []
    sum      = []

    for k in 0..length_x - 1 do
      for j in 0..length_x_i - 1 do
        sum.push(x[k][j] + y[k][j])
      end

      result.push(sum)

      sum = []
    end

    result
  end

  def split_matrix(x, length)
    middle_length  = length / 2

    upper_matrices = x[0..middle_length - 1]
    lower_matrices = x[middle_length.. - 1]

    result = [[],[], [], []]

    if upper_matrices.length == 1
      result[0].push(upper_matrices[0][0])
      result[1].push(upper_matrices[0][1])
      result[2].push(lower_matrices[0][0])
      result[3].push(lower_matrices[0][1])

      return result
    end

    result[0].push(upper_matrices[0][0..middle_length -1]).push(upper_matrices[1][0..middle_length -1])
    result[1].push(upper_matrices[0][middle_length..-1]).push(upper_matrices[1][middle_length..-1])
    result[2].push(lower_matrices[0][0..middle_length -1]).push(lower_matrices[1][0..middle_length -1])
    result[3].push(lower_matrices[0][middle_length..-1]).push(lower_matrices[1][middle_length..-1])

    return result
  end

# a_splited = [[a] [b] [c] [d]] 
# b_splited = [[e] [f] [g] [h]] 
# How to handle properly the base case when  a, b ,c ,d are numbers
  def is_2x2_matrix?(a)
    a[0].length == 1
  end

  def calculate_p1(a, b) 
    return [a[0][0] * (b[1][0] - b[3][0])] if is_2x2_matrix?(a)
p a 
p b
    [rec_matrix_multiplication(a[0], matrix_sum(b[1], minus_n_x_n(b[3])))]
  end

  def calculate_p2(a, b)
    return [(a[0][0] + a[1][0]) * b[3][0]]  if is_2x2_matrix?(a)

    [rec_matrix_multiplication(matrix_sum(a[0], (a[1])), b[3])]
  end

  def calculate_p3(a, b)
    return [(a[2][0] + a[3][0]) * b[0][0]] if is_2x2_matrix?(a)

    [rec_matrix_multiplication(matrix_sum(a[2], (a[3])), b[0])]
  end

  def calculate_p4(a, b)
    return [a[3][0] * (b[2][0] + minus_n_x_n(b[0][0]))] if is_2x2_matrix?(a)
    
    [rec_matrix_multiplication(a[3], matrix_sum(b[2], minus_n_x_n(b[0])))]
  end

  def calculate_p5(a, b)
    return [(a[0][0] + a[3][0]) * (b[0][0] + b[3][0])] if is_2x2_matrix?(a)
    
    [rec_matrix_multiplication(matrix_sum(a[0], (a[3])), matrix_sum(b[0], (b[3])))]
  end
 

  def calculate_p6(a, b)
    return [(a[1][0] + (-1 * a[3][0])) * (b[2][0] + b[3][0])]  if is_2x2_matrix?(a)
    
    [rec_matrix_multiplication(matrix_sum(a[1], minus_n_x_n(a[3])), matrix_sum(b[2], (b[3])))]
  end

  def calculate_p7(a, b)
    return [(a[0][0] + (-1 * a[2][0])) * (b[0][0] + b[1][0])]  if is_2x2_matrix?(a)
    
    [rec_matrix_multiplication(matrix_sum(a[0], minus_n_x_n(a[2])), matrix_sum(b[0], (b[1])))]
  end

  def minus_n_x_n(a)
    return -1 * a if a[0].class == Fixnum

    if is_2x2_matrix?(a)
      a.each_index {|num, index| a[index] = -1 * a[index] } 
    else
      a.each_with_index do |row, row_index|
        row.each_with_index {|num, num_index| a[row_index][num_index] = -1 * a[row_index][num_index] }
      end
    end  
    a
  end

#a2 = [[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2] ]
#b2 = [[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3] ]
#a  = [[1,1,1,1],[3,3,3,3],[5,5,5,5],[7,7,7,7]]
#b  = [[2,2,2,2],[4,4,4,4],[6,6,6,6],[8,8,8,8]]
#
# 2X2 Matrices examples:
 # a = [[2,2],[1,1]]
 # b = [[2,2],[1,1]]
 # p rec_matrix_multiplication(a,b)
 # p strassen_matrix_multiplication(a,b)
 # a = [[2,2],[1,1]]
 # b = [[1,1],[2,2]]
 # p rec_matrix_multiplication(a,b)
 # p strassen_matrix_multiplication(a, b)
 # a = [[1,2],[2,1]]
 # b = [[1,2],[2,1]]
 # p rec_matrix_multiplication(a,b)
 # a = [[2,1],[1,2]]
 # b = [[2,1],[1,2]]
 # p rec_matrix_multiplication(a,b)
 # p strassen_matrix_multiplication(a, b)
 # a = [[3,3],[3,3]]
 # b = [[2,2],[2,2]]
 # p rec_matrix_multiplication(a,b)
 # p strassen_matrix_multiplication(a, b)
 # a = [[1,4],[4,1]]
 # b = [[1,5],[5,1]]
 # p rec_matrix_multiplication(a,b)
 # p strassen_matrix_multiplication(a, b)
 # a = [[4,1],[1,4]];
 # b = [[5,1],[1,5]];
 # p rec_matrix_multiplication(a,b)
 # p strassen_matrix_multiplication(a, b)
 # a = [[9,9],[9,4]];
 # b = [[8,7],[6,5]];
 # p rec_matrix_multiplication(a,b)
 # p strassen_matrix_multiplication(a, b)
# a = [[1,1,1,1],[3,3,3,3],[2,2,2,2],[4,4,4,4]];
# b = [[5,5,5,5],[6,6,6,6],[7,7,7,7],[8,8,8,8]];
# p matrix_multiplication(a,b)

# 4x4 Matrices examples:
# a = [[1,1,1,1],[1,1,1,1],[2,2,2,2],[2,2,2,2]];
# b = [[2,2,2,2],[2,2,2,2],[1,1,1,1],[1,1,1,1]];
# p matrix_multiplication_brute_force(a,b)
 #rec_matrix_multiplication(a,b)
# strassen_matrix_multiplication(a,b)
# a = [[2,2,2,2],[2,2,2,2],[1,1,1,1],[1,1,1,1]];
# b = [[1,1,1,1],[1,1,1,1],[2,2,2,2],[2,2,2,2]];
# p matrix_multiplication(a,b)
# p matrix_multiplication_brute_force(a,b)
# a = [[1,1,1,1],[2,2,2,2],[2,2,2,2],[1,1,1,1]];
# b = [[1,1,1,1],[2,2,2,2],[2,2,2,2],[1,1,1,1]];
# p matrix_multiplication(a,b)
# p matrix_multiplication_brute_force(a,b)
# a = [[2,2,2,2],[1,1,1,1],[1,1,1,1],[2,2,2,2]];
# b = [[2,2,2,2],[1,1,1,1],[1,1,1,1],[2,2,2,2]];
# p matrix_multiplication(a,b)
# p matrix_multiplication_brute_force(a,b)
# a = [[3,3,3,3],[3,3,3,3],[3,3,3,3],[3,3,3,3]];
# b = [[2,2,2,2],[2,2,2,2],[2,2,2,2],[2,2,2,2]];
# p matrix_multiplication(a,b)
# p matrix_multiplication_brute_force(a,b)
# a = [[1,1,1,1],[4,4,4,4],[4,4,4,4],[1,1,1,1]];
# b = [[1,1,1,1],[5,5,5,5],[5,5,5,5],[1,1,1,1]];
# p  matrix_multiplication(a,b)
# p matrix_multiplication_brute_force(a,b)
# a = [[1,1,1,1],[1,1,1,1],[4,4,4,4],[5,5,5,5]];
# b = [[4,4,4,4],[5,5,5,5],[1,1,1,1],[1,1,1,1]];
# p  matrix_multiplication(a,b)
# p matrix_multiplication_brute_force(a,b)
# a = [[9,9,9,9],[9,9,9,9],[9,9,9,9],[4,4,4,4]];
# b = [[8,8,8,8],[7,7,7,7],[6,6,6,6],[5,5,5,5]];
# a = [[1,1,1,1],[3,3,3,3],[2,2,2,2],[4,4,4,4]];
# b = [[5,5,5,5],[6,6,6,6],[7,7,7,7],[8,8,8,8]];
# p matrix_multiplication(a,b)
# p matrix_multiplication_brute_force(a,b)
# p matrix_multiplication(a, b)
#  p split_matrix(b, 4)
 # a = [ [[1, 1], [1, 1]], [[3, 3], [3, 3]], [[2, 2], [2, 2]], [[4, 4], [4, 4]] ];
 # b = [ [[5, 5], [5, 5]], [[6, 6], [6, 6]], [[7, 7], [7, 7]], [[8, 8], [8, 8]] ];
a  = [[[1, 1], [1, 1]], [[1, 1], [1, 1]], [[2, 2], [2, 2]], [[2, 2], [2, 2]]]
b  = [[[2, 2], [2, 2]], [[2, 2], [2, 2]], [[1, 1], [1, 1]], [[1, 1], [1, 1]]]
 # a = [[ 1, 3], [2, 4]];
 # b = [[ 5, 6], [7, 8]];
 p calculate_p1(a, b) 
 #p strassen_matrix_multiplication(a, b)