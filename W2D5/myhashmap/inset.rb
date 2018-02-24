
class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store = Array.new(max) {false}
  end

  def insert(int)
    raise "out of range" if int > store.length
    @store[int] = true
  end

  def remove(int)
    @store[int] = false
  end

  def include?(int)
    # (store[int].nil?) ? false : true
    return false if int > @store.length
    @store[int]
  end
end

class InSet
  def initialize
    @store = Array.new(20) { Array.new }
  end

  def insert(int)
    i = int % 20
    @store[i] << int
    @store
  end

  def remove(int)
    raise "Non exist!" unless include?(int)
    i = int % 20
    subarr = @store[i]
    subarr.each do |num|
      subarr.delete(num) if num == int
    end
    @store
  end

  def include?(int)
    i = int % 20
    subarr = @store[i]
    subarr.each do |num|
      return true if num == int
    end
    false
  end
end

class ResizingIntSet

  def initialize(max)
    @store = Array.new(max){Array.new}
    @count = 0
    @max = max
  end

  def insert(int)
    @count += 1
    if @count > @store.length
      @max = @max * 2
      new_store = Array.new(@max){ Array.new }

      @store.flatten.each do |num|
          i = num % @max
          new_store[i] << num
      end
      @store = new_store
    end

    i = int % @max
    @store[i] << int
  end

  def remove(int)
    raise "Non exist!" unless include?(int)
    i = int % 20
    subarr = @store[i]
    subarr.each do |num|
      if num == int
        subarr.delete(num)
        @count -= 1
      end
    end
  end

  def include?(int)
    i = int % 20
    subarr = @store[i]
    subarr.each do |num|
      return true if num == int
    end
    false
  end

  def inspect
    @store.inspect
  end

end
