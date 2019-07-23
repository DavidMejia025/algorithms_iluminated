# As famous as Obama knows that this Bubble sort ("sorting by exchange) is not the rigth way to sort an array [1], it
# is a fancy way to perform the sorting in O(n^2) but as bad as brute force. The only advantage is
# its memory performance O(1) and is good when n is significantly low such as n < 50 [2].
#
# Procedure: This algorith looks if for a given element a[i] (of an array a of n elements) the next
# element a[i+1] is grater. If so then it swaps the elements, else do nothing and continue with the
# next element (i += 1) until reach the last pair (a[n-1]). By doing this procedure in each iteration
# the algorithm will take one element in the wrong order and will put it in the rigth place.
# For a completely unsorted array the full task will take n/2 times n elements.
#
# input:  a n element array (A)
# output: an array with all the elements of A sorted
#
# References:
# 1. https://www.youtube.com/watch?v=k4RRi_ntQc8
# 2. https://users.cs.duke.edu/~ola/bubble/bubble.html
#
#

def bubble_sort(a)
  finish = false

  while finish == false
    finish = true

    for i in 0..(a.length-2) do
       if a[i] > a[i+1]
         swap(a,i)
         finish = false
       end
    end
  end
end

def bubble_sort_2(a)
  finish = false

  while finish == false
    finish = true

    for i in 0..(a.length-2) do
      next i += 1 if a[i] == a[i+1]

      if a[i] > a[i+1]
        swap(a,i)
        finish = false
      end
    end
  end
end

def cocktail_shaker_sort(a)
  finish = false

  while finish == false
    finish = true

    for i in 0..(a.length - 2) do
      next i += 1 if a[i] == a[i+1]

      if a[i] > a[i+1]
        swap(a,i)
        finish = false

        if i < (a.length - 2) && a[i] < a[i-1]
          swap_reverse(a,i)
        end
      end
    end
  end
end

def swap(a,i)
  aux    = a[i]
  a[i]   = a[i+1]
  a[i+1] = aux
end

def swap_reverse(a,i)
  aux    = a[i]
  a[i]   = a[i-1]
  a[i-1] = aux
end

a = (1..10).map{|num| num}.reverse
bubble_sort(a)
p a
a = a.reverse
p a
bubble_sort_2(a)
p a
a = a.reverse
p a
cocktail_shaker_sort(a)
p a

