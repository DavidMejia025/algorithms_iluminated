#Weighted independent sets

def wis(a, count)
  count += 1
  return a.max    if a == [280,618]
  return a[0]     if a.length == 1

  n = a.length - 1

  return [wis(a[0..(n-1)], count),  wis(a[0..(n-2)], count)+a[n]].max
end


def wis_dp_david(a, count)
  n = (a.length) - 1

  i,   wis_n   = wis_rule(a[0..n], count)

  i_1, wis_n_1 = wis_rule(a[0..(n-1)],count)

  total_weigth_n   = wis_n + a[n]
  total_weigth_n_1 = wis_n_1 + a[n-1]

  total_weigth_n  > total_weigth_n_1 ? inner_wis(a[0..i], total_weigth_n, count) : inner_wis(a[0..(i_1)], total_weigth_n_1, count)
end

def wis_rule(a, count)
  count = 5

  n = a.length - 1

  close = a[n-2]
  far   = a[n-3]

  if close > far
   return n-2, a[n-2]
  else
   return n-3, a[n-3]
  end
end

def inner_wis(a, total_weigth, count)
  n = a.length - 1

  return n, total_weigth   if n == 1 || n == 0
  return n-2, total_weigth if n == 2

  n, v_i = wis_rule(a, count)

  inner_wis(a[0..n], total_weigth + v_i, count )
end

def wis_dp_memoization(a, memo,  count)
  return memo.push(a.max)    if a.length == 2
  return memo.push(a[0])     if a.length == 1

  n = a.length - 1

  if memo.empty?
    return [wis(a[0..(n-1)], count),  wis(a[0..(n-2)], count)+a[n]].max
  else
    return memo.push([memo[-1], memo[-2] + a[n]].max)
  end
end

def wis_bottom_up(a)
  mwis = [0]
  mwis[1] = a[0]

  for i in 2..(a.length) do
    mwis[i] = [mwis[i-1], mwis[i-2] + a[i-1]].max
  end

  return mwis[-1]
end

#test
file = File.open("test.txt")

array = file.map{|num| num.gsub("\n", "").to_i}
array =  array[1..(-1)]

p wis_dp_david(array,0)
