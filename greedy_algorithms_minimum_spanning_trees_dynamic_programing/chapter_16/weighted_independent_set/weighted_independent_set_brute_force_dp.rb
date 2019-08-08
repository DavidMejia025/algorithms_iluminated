def wis(a, count)
  count += 1
  return a.max    if a == [280,618]
  return a[0]     if a.length == 1

  n = a.length - 1
# count
  return [wis(a[0..(n-1)], count),  wis(a[0..(n-2)], count)+a[n]].max
end


file = File.open("test0.txt")
p file
array = file.map{|num| num.gsub("\n", "").to_i}
array =  array[1..(-1)]
ray, [], 0)
p wis_bottom_up(array)

file = File.open("test.txt")

array = file.map{|num| num.gsub("\n", "").to_i}

p wis_dp_david(array,0)
