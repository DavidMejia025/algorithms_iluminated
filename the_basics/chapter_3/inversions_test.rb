p test = File.open("inversions_test0.txt").each do|line|
  puts "1"
  puts line
end

my_file = File.open("inversions_test0.txt")
array = my_file.map do |li|
  li.gsub("\n","").to_i
end

p array
