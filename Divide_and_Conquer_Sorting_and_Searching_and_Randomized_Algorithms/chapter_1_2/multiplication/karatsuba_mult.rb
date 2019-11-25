# Karatsuba multiplication
# given two n-digit numbers the multiplication can be computed as follows
#
# x = 10^n/2 a * b
# y = 1-^n/2 c * d
#
# Following the same equation presented in the recursive multiplication
# algorith, the karatsuba multiplication does an improvement to calculate
# (ad + bc)
#
# In the first place (a*c) and (b*d) are calculated recursively.
#
# Then by computing  (a+b) * (c+d) just with primitive operations we have:
#
# a*c + a*d + b*c + bd.
#
# middle_term = (a+b) * (c+d) - (a*c) -(b*d) = a*d + b*c
#
# thus the multiplication can be performed with the same eq from the recursive
# algorithm,
#
# x * y = 10^n (ac) + 10^ n/2 (middle_term) + bd
#
# It is worth to notice that the karatsuma multiplication requires 3 recursive calls
# instead of 4.

def rec_int_mult(x,y)
  n = get_n(x)

  return x * y if n == 1

  a = split_upper(x, n)
  b = split_lower(x, n)
  c = split_upper(y, n)
  d = split_lower(y, n)

  a_c = rec_int_mult(a,c)
  b_d = rec_int_mult(b,d)

  middle_term = (a + b) * (c + d) - a_c - b_d

  return 10 ** (n) * (a_c) + 10 ** (n / 2) * middle_term + b_d
end

def split_upper(x, n)
  x / (10 ** (n / 2))
end

def split_lower(x, n)
  x % (10 ** (n / 2))
end

def get_n(x)
   test = x / 10

   return 1 if test == 0

   return get_n(test) + 1
end

def my_pow(x, pow, count = 1)
   return x if count == pow

   count += 1

   return my_pow(x, pow, count) * x
end

#test
m = 3141592653589793238462643383279502884197169399375105820974944592
n = 2718281828459045235360287471352662497757247093699959574966967627

num1 = 3333333333333333333333333333333333333333333333333333333333333333
num2 = 9999999999999999999999999999999999999999999999999999999999999999

p rec_int_mult(n, m) == n * m
p n.to_s.split("").length
