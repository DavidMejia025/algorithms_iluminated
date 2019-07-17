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

p matrix_multiplication_brute_force(a,b)

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
     [matrix_sum(matrix_multiplication(a_splited[0], b_splited[0]), matrix_multiplication(a_splited[1], b_splited[1]))].flatten,
     [matrix_sum(matrix_multiplication(a_splited[0], b_splited[1]), matrix_multiplication(a_splited[1], b_splited[3]))].flatten,
     [matrix_sum(matrix_multiplication(a_splited[2], b_splited[0]), matrix_multiplication(a_splited[3], b_splited[1]))].flatten,
     [matrix_sum(matrix_multiplication(a_splited[2], b_splited[1]), matrix_multiplication(a_splited[3], b_splited[3]))].flatten
   ]
  )
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

  middle_length.times do |row|
    result[0].push(upper_matrices[row][0..middle_length -1])
    result[1].push(upper_matrices[row][middle_length..-1])
    result[2].push(lower_matrices[row][0..middle_length -1])
    result[3].push(lower_matrices[row][middle_length..-1])
  end

  return result
end

a2 = [[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2],[2,2,2,2,2,2,2,2] ]
b2 = [[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3],[3,3,3,3,3,3,3,3] ]
a  = [[2,2,2,2],[2,2,2,2],[2,2,2,2],[2,2,2,2]]
b  = [[3,3,3,3],[3,3,3,3],[3,3,3,3],[3,3,3,3]]
a0 = [[2,2], [2,2]]
b0 = [[3,3], [3,3]]
a1 = [[6, 6], [6, 6], [6, 6], [6, 6]]
b1 = [[6, 6], [6, 6], [6, 6], [6, 6]]
a3 = []
16.times {|i| a3.push([2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2])}
b3 = []
16.times {|i| b3.push([3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3])}

p r = matrix_multiplication(a, b)
p r.length
p r0 = matrix_multiplication(a0,b0)
p r0[0].length
p r2 = matrix_multiplication(a2,b2)
p r2[0].length
p r3 = matrix_multiplication(a3,b3)
p r3[0].length
