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

  v_max = v.map{|val| val[0]}.max

  candidates = v.select{|val| val[0] == v_max}

  w_min = candidates.map{|val| val[1]}.min

  if (capacity - w - w_min) >= 0
    p candidates
    state_i = candidates.select{|state| state[1] == w_min}
  else
    v.reject!{|val| val[0] == v_max}

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
puts v.sort
p new_v = v.sort[1..5]
capacity = 0
p new_v[0][1]
p new_v.each{|val| capacity += val[1]}
p capacity
p "start"
p max = v.map{|val| val[0]}.max
p knapsack(capacity, v[1..-1], 0, 0)
#p " the basic"
#p knapsack(capacity, v_basic, 0, 0)
#f_s_to_i = lambda{|v| v.map(&:to_i)}
#v = f_s_to_i.call("79 32 47 18 26 85 33 40 45 59".split(" "))
#w = f_s_to_i.call("85 26 48 21 22 95 43 45 55 52".split(" "))
#v_web_example = []
#p v
#p w
#v.each_with_index{|val,index| v_web_example.push([v[index], w[index]])}
#p v_web_example
#p knapsack(101, v_web_example, 0, 0)
