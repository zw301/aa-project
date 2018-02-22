class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    result = []
    self.my_each do |el|
      result << el if prc.call(el)
    end
    result
  end

  def my_reject(&prc)
    result = []
    self.my_each do |el|
      result << el unless prc.call(el)
    end
    result
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  # def my_flatten(array = self, result=[])
  #   array.my_each do |el|
  #     if el.class == Array
  #       my_flatten(el, result)
  #     else
  #       result << el
  #     end
  #   end
  #   result
  # end

  def my_flatten
    each_with_object([]) do |el, flattened|
      flattened.push *(el.is_a?(Array) ? el.my_flatten : el)
    end

  end

  def my_zip(*arg)
    len = self.length
    new_ary = Array.new(len) {Array.new}

    self.each_with_index do |el,i|
      new_ary[i] << el
      arg.each do |ary|
        new_ary[i] << ary[i]
      end
    end
    new_ary
  end

  def my_rotate(n = 1)
    if n < 0
      while n < 0
        n += self.length
      end
    elsif n > self.length
      n = n % self.length
    end
    self.drop(n) + self.take(n)
  end

  def my_join(separator = "")
    result = ""
    each_with_index do |el, i|
      result << el
      result << separator unless i == length - 1
    end
    result
  end

  def my_reverse
    result = []
    (self.length - 1).downto(0).each do |i|
      result << self[i]
    end

    result
  end
end









[1,2,3].my_each { |el| p el }
p [1,2,3].my_select { |el| el > 1 }
p [1,2,3].my_reject { |el| el > 1 }
p [1,2,3].my_any? { |el| el == 4 }
p  [1,2,3].my_any? { |el| el != 4 }
p [1,2,[3,4,[5]]].my_flatten
a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b)


a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)


a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")


p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse
