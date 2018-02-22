class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end
    self
  end

  def my_select(&prc)
    selects = []
    self.my_each do |el|
      selects << el if prc.call(el)
    end

    selects
  end

  def my_reject(&prc)
    selects = []

    self.my_each do |el|
      selects << el unless prc.call(el)
    end

    selects
  end

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call(el)
    end
    true
  end

  def my_flatten
    flattened = []
    self.my_each do |el|
      if el.is_a?(Array)
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end
    flattened
  end

  def my_zip(*arrays)
    zipped = []

    self.length.times do |i|
      subzip = [self[i]]
      arrays.my_each do |array|
        subzip << array[i]
      end

      zipped << subzip
    end

    zipped
  end

  def my_rotate(pos = 1)
    split_idx = pos % self.length

    self.drop(split_idx) + self.take(split_idx)
  end

  def my_join(separator = "")
    join = ""
    self.length.times do |i|
      join += self[i]
      join += separator unless i == self.length - 1
    end

    join
  end

  def my_reverse
    reversed = []

    self.my_each do |el|
      reversed.unshift(el)
    end

    reversed
  end

end


a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)
 # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


puts "======================="
a = [ "a", "b", "c", "d" ]
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
