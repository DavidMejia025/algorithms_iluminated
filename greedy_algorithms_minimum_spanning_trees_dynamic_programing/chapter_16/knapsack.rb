# Knapsack problem
#
#
#
#
def knapsack(capacity, v, val, w)
  w_min = min_weigth(v)[1]
p w_min
  return val if capacity <= w + w_min

  v_i = pick_v(capacity, v, w)
p v_i
  w   = w + v_i[1]
  val = val + v_i[0]
  v.reject!{|state| state[0] == v_i[0] && state[1] == v_i[1]}
p v
  knapsack(capacity, v, val, w)
end

def pick_v(capacity, v, w)
  v_max = v.map{|val| val[0]}.max

  candidates = v.select{|val| val[0] == v_max}

  w_min = candidates.map{|val| val[1]}.min

  if (capacity - w - w_min[0]) > 0
    state_i = candidates.select{|state| state[1] == w_min}
  else
    v.reject!{|val| val[0] == v_max}
    pick_v(capacity, v, w)
  end

  state_i[0]
end

def min_weigth(v)
  w_min = v.map{|val| val[1]}.min
end

capacity = 6
v =
  [
    [3,4],
    [2,3],
    [4,2],
    [4,3]
  ]
val = 0

w = 0

p knapsack(6, v, 0, 0)
