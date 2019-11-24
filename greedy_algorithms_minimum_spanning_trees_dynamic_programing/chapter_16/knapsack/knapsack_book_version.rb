# Knapsack problem
#
#
#
#
#
def knapsack(capacity, v)
  if v.length == 1
    return capacity - v[0][1] >= 0 ? v[0][0] : 0
  end
  #v_k = v.pop if capacity - v_k[1] < 0
  left  = knapsack(capacity, v[0..-2])

  rigth = capacity >=  v[-1][1] ? knapsack(capacity - v[-1][1], v[0..-2]) + v[-1][0] : 0

  [left, rigth].max
  #[knapsack(capacity, v)[0], knapsack(capacity - v_k[1], v)[0] + v_k[0]].max
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
capacity =100
p knapsack(capacity, v_basic)
file = File.open("knapsack_test0.txt")
v = file.map{|ver| ver.gsub("\n", "").split(" ").map(&:to_i)}
#p v.length
p "start"
ans = 2493893
capacity = v[0][0]
v        = v[1..-81]
p v.length
p capacity
p res =  knapsack(capacity, v)
# ans - res[0]
#p "web ex"
#f_s_to_i = lambda{|v| v.map(&:to_i)}
#v = f_s_to_i.call("79 32 47 18 26 85 33 40 45 59".split(" "))
#w = f_s_to_i.call("85 26 48 21 22 95 43 45 55 52".split(" "))
#v_web_example = []
#p v
#p w
#v.each_with_index{|val,index| v_web_example.push([v[index], w[index]])}
#p v_web_example
#p knapsack(101, v_web_example)
