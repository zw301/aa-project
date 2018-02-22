def range(start_num,end_num)
  return [] if end_num <= start_num

  range(start_num,end_num-1) << end_num - 1
end


# def sum_i(arr)
#   sum = 0
#   arr.each do |num|
#     sum += num
#   end
#   sum
# end

def sum_i(arr)
  # arr.reduce(0) {|acc, el| acc + el}
  arr.reduce(0, &:+) #syntax sugar
end

def sum_r(arr)
  return nil if arr.empty?
  return arr.first if arr.length == 1
   sum_r(arr[0...-1])+ arr[-1]
end


def exp1(b, n)
  return 1 if n == 0

  b * exp1(b, n - 1)
end

def exp2(b, n)
  return 1 if n == 0
  # return b if n == 1

  if n.even?
    exp2(b, n / 2) * exp2(b, n / 2)
  else
    b * (exp2(b, (n - 1) / 2) * exp2(b, (n - 1) / 2))
  end
end

def deep_dup(arr)
  result = []
  arr.each do |el|
    if el.is_a?(Array)
      result << deep_dup(el)
    else
      result << el
    end
  end

  result
end

def fib(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  prev = fib(n - 1)
  prev << prev[-1] + prev[-2]
end



def subsets(arr)
  return [[]] if arr.empty?

  subs = subsets(arr[0...-1])

  # new_part = subs.dup
  # new_part.each_index do |i|
  #   new_part[i] = new_part[i] + [arr.last]
  # end

  new_part = []
  subs.each_index do |i|
    new_part << (subs[i] + [arr.last])
  end

  subs.concat(new_part)
end

def permutation(arr)
  return [arr] if arr.length == 1

  last = arr.pop

  prev = permutation(arr)

  result = []
  prev.each do |arr|
    (0..arr.length).each do |i|
      result << arr[0...i] + [last] + arr[i..-1]
    end
  end
  result
end

def bsearch(arr, target)
  # return arr[mid] == target ? mid : nil

  # mid = arr.length / 2
  lo = 0
  hi = arr.length - 1
  # helper(arr, 0, mid, target)
  # helper(arr, mid + 1, hi, target)

  helper(arr, lo, hi, target)

end

def helper(arr, lo, hi, target)
  return nil if lo > hi
  mid = (lo + hi)/ 2
  if arr[mid] == target
    return mid
  elsif arr[mid] > target
    hi = mid
    helper(arr, lo, hi, target)
  else
    lo = mid + 1
    helper(arr, lo, hi, target)
  end
end

def merge_sort(arr)

  return arr if arr.length == 1

  mid = arr.length / 2

  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])

  merge(left, right)
end

def merge(left, right)
  len = left.length + right.length
  result = []

  i = 0
  j = 0
  while result.length < len
    if i >= left.length
      result << right[j]
      j += 1
    elsif j >= right.length
      result << left[i]
      i += 1
    elsif left[i] < right[j]
      result << left[i]
      i += 1
    else
      result << right[j]
      j += 1
    end
  end

  result
end




puts "========================="
p range(1,5)
p range(1,10)

p sum_i([1,2,3])

p sum_r([1,2,3,4])
p sum_r([])

p exp1(2, 3)

p exp2(2, 4)

p deep_dup([1,[2, [3,4]]])

p fib(9)

p subsets([1, 2, 3])

p permutation([1,2,3])

p bsearch([1,2,3,4,5,6,7], 50)


p merge_sort([9,3,5,1,2,7])
