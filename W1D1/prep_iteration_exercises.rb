def factors(num)
  (1..num).select { |i| num % i == 0 }
end

class Array
  def bubble_sort
    new_ary = self.dup
    new_ary.bubble_sort!
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    i = 0
    while i < self.length
      j = 0
      while j < self.length - 1 - i
        if prc.call(self[j],self[j+1]) == 1
          self[j],self[j+1] = self[j+1],self[j]
        end
        j += 1
      end
      i += 1
    end
    self
  end
end

def substrings(string)
  # result = []
  # string.chars.each_index do |i|
  #   string.chars.each_index do |j|
  #     result << string[i..j] if i <= j
  #   end
  # end
  # result

  result = []
  string.chars.each_index do |i|
    (1..string.length).each do |len|
      result << string.slice(i, len) if i + len <= string.length
    end
  end
  result

  # result = []
  # string.length.downto(1).each do |len|
  #   string.chars.each_cons(len) do |substring|
  #     result << substring.join("")
  #   end
  # end
  # result.sort
end

def subwords(word, dic)
  array = substrings(word)

  array.select {|word| dic.include?(word)}
end


def doubler(array)
  array.map {|el| el * 2}
end


class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_map(&prc)
    result = []
    self.my_each do |el|
      result << prc.call(el)
    end
    result
  end

  def my_select(&prc)
    result = []
    my_each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_inject(&blk)
    result = self[0]
    (1...self.length).to_a.my_each do |i|
      result = blk.call(result,self[i])
    end
    result
  end
end

def concatenate(strings)
  strings.inject(:+)
end





p factors(10)

ary = [1,4,2,8,9,3]
p ary.bubble_sort()
p ary


p substrings("cat")


p subwords("cappt", ["c", "t"])

p doubler([1,2,3])

return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end

p [1,2,3].my_map { |el| el * 2 }

p [1,2,3].my_select { |el| el.odd? }

p [1, 2, 3].my_inject { |sum, num| sum + num }

p concatenate(["Yay ", "for ", "strings!"])
