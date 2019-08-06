# Knapsack problem
#
#
#
#
def knapsack(capacity, v, val, w)
  w_min = min_weigth(v)

  if capacity <= (w + w_min)
    w_min
    w
    capacity
    return val, w, capacity
  end
  v_i = pick_v(capacity, v, w)
# v_i
#   if v.length <= 85
#     p "debug"
#     p v_i
#     p capacity - w
# p   w   = w + v_i[1]
# p "debug"
#   end

  w   = w + v_i[1]
  val = val + v_i[0]

  v.reject!{|state| state[0] == v_i[0] && state[1] == v_i[1]}
# v
  knapsack(capacity, v, val, w)
end

def pick_v(capacity, v, w)
   v
  return [0,0] if v.empty?

  w_min = v.map{|val| val[1]}.min

  candidates = v.select{|val| val[1] == w_min}

  v_max = candidates.map{|val| val[0]}.max

 # v_max = v.map{|val| val[0]}.max
 #
 # candidates = v.select{|val| val[0] == v_max}
 #
 # w_min = candidates.map{|val| val[1]}.min

  if (capacity - w - w_min) >= 0
    p candidates
    state_i = candidates.select{|state| state[0] == v_max}
  else
    v.reject!{|val| val[1] == w_min}

    return pick_v(capacity, v, w)
  end

  state_i[0]
end

def min_weigth(v)
  w_min = v.map{|val| val[1]}.min
end

capacity = 6
v_basic =
  [
    [3,4],
    [2,3],
    [4,2],
    [4,3]
  ]
val = 0

w = 0

file = File.open("knapsack_test0.txt")
# = file.map{|ver| ver.gsub(" ",",").gsub("\n", "").split(",").reduce(&:to_i)}
v = file.map{|ver| ver.gsub("\n", "").split(" ").map(&:to_i)}
p v.length
 v_test = v.sort.reverse
p v_test[0..40]
i = 0
val = 0
cap = 0
while  cap <= 10000
  val += v_test[-1-i][0]
  cap += v_test[-1-i][1]
  i   += 1
end

p "start"
ans = 2493893
capacity = v[0][0]
v        = v[1..-1]
p res =  knapsack(capacity, v, 0, 0)
p ans - res[0]
p " the basic"
capacity = 6
p knapsack(capacity, v_basic, 0, 0)
f_s_to_i = lambda{|v| v.map(&:to_i)}
v = f_s_to_i.call("79 32 47 18 26 85 33 40 45 59".split(" "))
w = f_s_to_i.call("85 26 48 21 22 95 43 45 55 52".split(" "))
v_web_example = []
p v
p w
v.each_with_index{|val,index| v_web_example.push([v[index], w[index]])}
p v_web_example
p knapsack(101, v_web_example, 0, 0)
