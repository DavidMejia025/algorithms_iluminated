# Recursive integer multiplication
# given two n-digit numbers the multiplication can be computed as follows
#
# x = 10^n/2 a * b
# y = 1-^n/2 c * d
#
# thus,
#
# x * y = 10^n (ac) + 10^ n/2 (ad + bc) + bd
#

def rec_int_mult(x,y)
  n = get_n(x)

  return x * y if n == 1

  a = split_upper(x, n)
  b = split_lower(x, n)
  c = split_upper(y, n)
  d = split_lower(y, n)

  a_c = rec_int_mult(a,c)
  b_d = rec_int_mult(b,d)
  a_d = rec_int_mult(a,d)
  c_b = rec_int_mult(b,c)

  return 10 ** (n) * (a_c) + 10 ** (n / 2) * (a_d + c_b) + b_d
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

p n * m

p n_result = rec_int_mult(n, m)

p n_result == n * m
