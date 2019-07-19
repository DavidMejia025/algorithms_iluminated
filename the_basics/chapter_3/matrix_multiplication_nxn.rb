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

def matrix_multiplication(a, b)
  matrix_length = a.length

  return a[0][0] * b[0][0] if matrix_length == 1

  a_splited = split_matrix(a, matrix_length)
  b_splited = split_matrix(b, matrix_length)


 result = (
  [
    [matrix_sum(matrix_multiplication(a_splited[0], b_splited[0]), matrix_multiplication(a_splited[1], b_splited[2]))] +
    [matrix_sum(matrix_multiplication(a_splited[0], b_splited[1]), matrix_multiplication(a_splited[1], b_splited[3]))] +
    [matrix_sum(matrix_multiplication(a_splited[2], b_splited[0]), matrix_multiplication(a_splited[3], b_splited[2]))] +
    [matrix_sum(matrix_multiplication(a_splited[2], b_splited[1]), matrix_multiplication(a_splited[3], b_splited[3]))]
  ]
 )
p"middle"
 #result = build(result[0], result[0].length)
p "finish"
result
end

def build(n, length_n)
    n_x_n = []
    row   = []
    k     = 0

 for i in 0..(length_n ** (0.5) - 1)
   for j in 0..(length_n ** (0.5) - 1)
     row.push(n[k])

     k += 1
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

  return result
end

def split_matrix(x, length)
  middle_length  = length / 2

  upper_matrices = x[0..middle_length -1]
  lower_matrices = x[middle_length..-1]

  result = [[],[], [], []]
p "row"
p x
p upper_matrices
p lower_matrices
p "111"
# middle_length.times do |row|
#  p "3"
#  p row
#  p  result[0].push(upper_matrices[row][0..middle_length -1])
#  p result[1].push(upper_matrices[row][middle_length..-1])
#  p result[2].push(lower_matrices[row][0..middle_length -1])
#  p  result[3].push(lower_matrices[row][middle_length..-1])
#  p"4"
# end


   if upper_matrices.length == 1
     result_2 = [[],[]]
     p "end"
     result_2[0].push(upper_matrices[0]
     result_2[1].push(lower_matrices[1]
     result_2[2].push(lower_matrices[0]
     result_2[3].push(lower_matrices[1]
     return result_2
   end

  result_2 = [[],[],[],[]]

  result_2[0].push(upper_matrices[0][0..middle_length -1]).push(upper_matrices[0][middle_length..-1])
  result_2[1].push(upper_matrices[1][0..middle_length -1]).push(upper_matrices[1][middle_length..-1])
  result_2[2].push(lower_matrices[0][0..middle_length -1]).push(lower_matrices[0][middle_length..-1])
  result_2[3].push(lower_matrices[1][0..middle_length -1]).push(lower_matrices[1][middle_length..-1])

p "result_2"
p result_2
  return result_2
end

a2 = [[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2] ]
b2 = [[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3] ]
a  = [[1,1,1,1],[3,3,3,3],[5,5,5,5],[7,7,7,7]]
b  = [[2,2,2,2],[4,4,4,4],[6,6,6,6],[8,8,8,8]]
a0 = [[2,2], [2,2]]
b0 = [[3,3], [3,3]]
a1 = [[6, 6,6,6], [6, 6,6,6], [6, 6,6,6], [4,4,4,4]]
b1 = [[4, 4,4,4], [6, 6,6,6], [6, 6,6,6], [6, 6,6,6]]
a3 = []
16.times {|i| a3.push([2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2])}
b3 = []
16.times {|i| b3.push([3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3])}

# r = matrix_multiplication(a, a)
# rr = build(r[0], r[0].length)
#
# r = matrix_multiplication(b1,b1)
# r0 = matrix_multiplication(a0,b0)
# r2 = matrix_multiplication(a2,b2)
# r3 = matrix_multiplication(a3,b3)
test_2_a = [[1,2],[3,4]]
test_2_b = [[5,6],[7,8]]

# matrix_multiplication(test_2_a, test_2_b)
p matrix_multiplication(a, b)

p split_matrix(a1, 4)
 # Once the recursion multiplication is done again the key question emerges again, Can we do better?. And the answer is yes, taking into
 # accout the previeus experience with the two n digit integeres multiplication where a math trick from a gauss expressin helped Karatsuma
 # to improve that algoritm, Prof strassen also came out with an tricky aproach to recursively solve the matrix multiplication problem.
 # In this case the algorithm will split the original matrix in 4th matrices but the equation to conquer the solution will be as follows:
 #
 #
#a2 = [[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2] ]
#b2 = [[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3] ]
#a  = [[1,1,1,1],[3,3,3,3],[5,5,5,5],[7,7,7,7]]
#b  = [[2,2,2,2],[4,4,4,4],[6,6,6,6],[8,8,8,8]]
#a0 = [[2,2], [2,2]]
#b0 = [[3,3], [3,3]]
#a1 = [[6, 6,6,6], [6, 6,6,6], [6, 6,6,6], [4,4,4,4]]
#b1 = [[4, 4,4,4], [6, 6,6,6], [6, 6,6,6], [6, 6,6,6]]
#a3 = []
#16.times {|i| a3.push([2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2])}
#b3 = []
#16.times {|i| b3.push([3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3])}
#
# r = matrix_multiplication(a, a)
# rr = build(r[0], r[0].length)
#
# r = matrix_multiplication(b1,b1)
# r0 = matrix_multiplication(a0,b0)
# r2 = matrix_multiplication(a2,b2)
# r3 = matrix_multiplication(a3,b3)
