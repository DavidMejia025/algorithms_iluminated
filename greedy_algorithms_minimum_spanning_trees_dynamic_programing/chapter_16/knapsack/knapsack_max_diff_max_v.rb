# Knapsack problem
#
#
#
#
def knapsack(capacity, v, val, w)
  w_min = min_weigth(v)

  return val, w, capacity if capacity <= (w + w_min)

  v_i = pick_v(capacity, v, w)

  w   = w + v_i[1]
  val = val + v_i[0]

  v.reject!{|state| state[0] == v_i[0] && state[1] == v_i[1]}

  knapsack(capacity, v, val, w)
end

def pick_v(capacity, v, w)
  diff_max   = v.map{|val| val[2]}.max
  candidates = v.select{|val| val[2] == diff_max}

  element_max = candidates.map{|val| val[0]}.max
  element     = candidates.select{|val| val[0] == element_max}

  if (capacity - w - element[0][1]) >= 0
    state_i = candidates.select{|state| state[0] == element_max}
  else
    v.reject!{|val| val[0] == element[0][0]}

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

p "start"
ans = 2493893
capacity = v[0][0]
v        = v[1..-1]
v = v.reduce([]){|accu, val| accu + [[val[0], val[1], (val[0]-val[1])]]}
p res =  knapsack(capacity, v, 0, 0)
p ans - res[0]

p " the basic"
capacity = 6
v_basic = v_basic.reduce([]){|accu, val| accu + [[val[0], val[1], (val[0]-val[1])]]}
p v_basic
p knapsack(capacity, v_basic, 0, 0)
 f_s_to_i = lambda{|v| v.map(&:to_i)}
 v = f_s_to_i.call("79 32 47 18 26 85 33 40 45 59".split(" "))
 w = f_s_to_i.call("85 26 48 21 22 95 43 45 55 52".split(" "))
 v_web_example = []
 v.each_with_index{|val,index| v_web_example.push([v[index], w[index]])}
 v_web_example = v_web_example.reduce([]){|accu, val| accu + [[val[0], val[1], (val[0]-val[1])]]}
 p knapsack(101, v_web_example, 0, 0)
