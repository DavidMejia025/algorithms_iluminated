# Knapsack problem
#
#                    [a,b,c]                       c
#          [a,b]                [a,b]              b
#      [a]       [a]        [a]       [a]          a
#   [0]   [a] [b]  [a,b] [c]  [ca] [cb]  [cba]
#
#                    [a,b,c]                       c
#          [a,b]                [a,b]c             b
#      [a]       [a]b        [a]c       [a]bc      a
#
#                       [a,b,c]                    c
#          [[a],[[a]b]           [[a]c,[[a]bc]]    b
#      [a]       [a]b        [a]c       [a]bc      a
#
#      1.  [a]             // A[0] = a
#      2.  [a]b            // A[1] = A[0] + b
#      3.  [a],[a]b        // A[2] = max(A[0],A[1])
#      4.  [a,b]c          // A[3] = A[2] + c
#      5.  [a,b,c]         // A[4] = max(A[3],A[2])
#
#                 [a,b,c,d]
#         [a,b,c]                   [a,b,c]d
#     [a,b]    [a,b] c        [a,b]d      [a,b]dc
#  [a]   [a]b [a]c  [a]bc  [a]d  [a]bd [a]dc [a]bdc
#
#
#                                              [a,b,c,d,e]
 #                 [a,b,c,d]                                             [a,b,c,d]e
 #         [a,b,c]                   [a,b,c]d                 [a,b,c]e                     [a,b,c]ed
 #     [a,b]    [a,b] c        [a,b]d      [a,b]dc      [a,b]e      [a,b]ec         [a,b]ed         [a,b]edc
 #  [a]   [a]b [a]c  [a]bc  [a]d  [a]bd [a]dc [a]bdc  [a]e [a]eb [a]ec [a]ecb   [a]ed  [a]edb  [a]edc   [a]edcb
#
#      1.  [a]             // A[0] = a
#      2.  [a]b            // A[1] = A[0] + b
#      3.  [a],[a]b        // A[2] = max(A[0],A[1])   // [a,b]
#      4.  [a,b]c          // A[3] = A[2] + c
#      5.  [a,b,c]         // A[4] = max(A[3],A[2])
#      6.  [a,b,c]d        // A[5] = A[4] + d
#      7.  [a,b,c,d]       // A[6] = max(A[4],A[5])
#      8.  [a,b,c,d]e      // A[7] = A[6] + e
#      9.  [a,b,c,d,e]     // A[8] = max(A[6],A[7])
#
def knapsack(capacity, v, memo)
  if v.length == 1
    a = ((capacity - v[0][1]) >= 0) ? [v[0][0], v[0][1]] : [0,0]

    memo = memo.push(a)
    return knapsack(capacity, v[0], memo)
  end

  if memo.empty?
    left  = knapsack(capacity, v[0..-2], memo)

    if memo.empty?
      right = (capacity >=  v[-1][1]) ? knapsack(capacity - v[-1][1], v[0..-2], memo) + v[-1][0] : 0
    else

      if ((capacity - memo[0][1]) - v[-1][1]) >= 0
        right = [memo[0][0] + v[-1][0], memo[0][1]+ v[-1][1]]
      elsif (capacity -  v[-1][1]) >= 0
        right = [v[-1][0], v[-1][1]]
      else
        right = [0,0]
      end

      left  = memo.pop
    end
  else

    if (capacity -  v[-1]) >= 0
      right = [v[0], v[1]]
    else
      right = [v[0],v[1]]
    end
    left  =  memo.pop
  end

  max_v = [left[0], right[0]].max
  max_w =  (left[0] == max_v) ? left[1] : right[1]
 "end"
  memo.push([max_v, max_w])
end

v_basic1 =
  [
    [3,4],
    [2,3],
    [4,2],
    [4,3]
  ]

v_basic2 =
  [
    [4,3],
    [3,4],
    [2,3],
    [4,2]
  ]

v_basic3 =
  [
    [4,2],
    [4,3],
    [3,4],
    [2,3]
  ]

v_basic4 =
  [
    [2,3],
    [4,2],
    [4,3],
    [3,4]
  ]

capacity =6
p res = knapsack(capacity, v_basic1, [])
p res = knapsack(capacity, v_basic2, [])
p res = knapsack(capacity, v_basic3, [])
p res = knapsack(capacity, v_basic4, [])
#file = File.open("knapsack_test0.txt")
#v = file.map{|ver| ver.gsub("\n", "").split(" ").map(&:to_i)}
##p v.length
#p "start"
#ans = 2493893
#capacity = v[0][0]
#v        = v[1..-81]
#p v.length
#p capacity
#p res =  knapsack(capacity, v, memo)
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
