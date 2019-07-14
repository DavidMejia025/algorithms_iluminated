def recursion(n)
  return 0  if n == 0

  return recursion(n-1) + n
end
z = 100
a = 1000
b = 10000
# from c the pc brokes
c = 100000
d = 1000000
# array = [z,a,b,c,d]
  array = [z,a,b]
 p array.map { |n| recursion(n) }
 p array.map { |n| n**2 }
 p array.map { |n| n**2/2 }


 def factorial(n)
 return 1 if n == 1

 return factorial(n-1)*n
 end

 n = 10
 p = 6
 p "#{n}!"
 p "combination"
 p factorial(n) / (factorial(p) * factorial(n-p))

 p "n ** 2"
 p n ** 2/2

 n = 10
 count = 0
 for i in 1..n do
   for j in 1+i..n do
     count += 1
   end
 end

 p "loops"

 p count
 p factorial(5)
