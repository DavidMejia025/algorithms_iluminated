# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
    return 0 if needle.empty?

    length_haystack = haystack.length

    result = -1

    length_haystack.times do |index|
        possitive = find_needle?(haystack,needle, index) if haystack[index] == needle[0]

        if possitive
            result = index
            break
        end
    end

    result
end

def find_needle?(string, test, index)
   length_test = test.length

    return true if length_test == 1

    n = length_test
    k = index

    result = ""

    n.times do |iterator|
       break result = false unless string[k] == test[iterator]

       k      += 1
       result += test[iterator]
    end

    result == test
end

def find_needlei_improved?(string, test, index)
   length_test = test.length

    return true if length_test == 1

    string[index..(index+length_test-1)] == test
end


# to recap later: o(n*n) vs o(n)
# class Solution {
# public:
# 	char *strStr(char *haystack, char *needle) {
# 		for(int i = 0; haystack[i] != '\0'; ++i) {
# 			int t = i, j;
# 			for(j = 0; haystack[t] != '\0' && needle[j] != '\0'; ++j, ++t) {
# 				if(haystack[t] != needle[j]) break;
# 			}
# 			if(needle[j] == '\0') return haystack+i;
# 		}
# 		return NULL;
# 	}
# };
# Solution 2: AC
#
# class Solution {
# public:
#     char *strStr(char *haystack, char *needle) {
#         int i = 0, j = 0;
#         while(haystack[i] != '\0' && needle[j] != '\0') {
#
#             if(haystack[i] == needle[j])
#                 ++i, ++j;
#             else
#                 i = i-j+1, j = 0;
#         }
#         return needle[j] == '\0' ? haystack+(i-j) : NULL;
#     }
# };
#
# # @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str_rabin_karp(txt, pat)
  return 0 if pat.empty?
  m = pat.length
  n = txt.length
  return -1 if m > n
  p = 0
  t = 0
  h = 1
  q = 97
  d = 256
  (0..m-2).each do
    h = (h*d)%q
  end
  (0..m-1).each do |i|
    p = (p*d+pat[i].ord)%q
    t = (t*d+txt[i].ord)%q
  end
  (0..n-m).each do |i|
    if t == p && pat == txt[i..i+m-1]
      return i
    else
      t = (d*(t-h*txt[i].ord)+txt[i+m].ord)%q if i != n-m
    end
  end
  -1
end

def naive_str_str_finite_automata_winner(haystack, needle)
  return 0 if needle.empty?
  pattern_length = needle.length
  i = 0
  while i <= (haystack.length - pattern_length) do
    return i if needle == haystack.slice(i, pattern_length)
    i += 1
  end
  return -1
end

def str_str(haystack, needle)
  return 0 if needle.empty?
  return naive_str_str(haystack, needle) if haystack.length/needle.length < 100
  return 0 if needle.empty?
  table = build_jump_table(needle)
  q = 0
  final_point = needle.length
  haystack.each_char.each_with_index do |char, index|
    q = table[q][char] || 0
    if q == final_point
      return (index+1-final_point)
    end
  end
  return -1
end

def build_jump_table(needle)
  k = needle.length
  table = Array.new(k)
  uniq_chars = needle.split('').uniq
  k.times do |i|
    current_sub_needle = needle[0..(i-1 < 0 ? 0 : i-1)]
    table[i] ||= {}
    uniq_chars.each do |char|
      start_point = i
      final_point = 0
      while(start_point >= 0) do
        next_sub_needle = needle[0..start_point]
        if is_prefix(next_sub_needle, current_sub_needle, char)
          final_point = start_point+1
          break
        end
        start_point -= 1
      end
      table[i][char] = final_point
    end
  end
  return table
end

def is_prefix(prefix, content, char)
  return true if prefix.empty?
  prefix == (content+char)[-prefix.length..-1]
end

# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str_simple_elegant_and_the_winner(haystack, needle)
  return 0 if !needle || needle.empty?
  needle_length = needle.length
  str_length = haystack.length

  left = 0
  right = needle_length - 1

  while right < str_length
    return left if haystack[left..right] == needle
    left += 1
    right += 1
  end
  -1
end
