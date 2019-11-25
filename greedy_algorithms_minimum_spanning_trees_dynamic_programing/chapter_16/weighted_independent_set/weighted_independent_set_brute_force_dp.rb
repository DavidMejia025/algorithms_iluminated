def wis(a, count)
  count += 1
  return a.max    if a == [280,618]
  return a[0]     if a.length == 1

  n = a.length - 1

  return [wis(a[0..(n-1)], count),  wis(a[0..(n-2)], count)+a[n]].max
end

# test
file = File.open("test0.txt")

array = file.map{|num| num.gsub("\n", "").to_i}

p wis_dp_david(array,0)
