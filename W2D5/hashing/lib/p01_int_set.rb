class MaxIntSet
  def initialize(max)
      @store = Array.new(max) {false}
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
      @store[num] = false
  end

  def include?(num)
    return false if num > @store.length
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % 20
    @store[i] << num
    @store
  end

  def remove(num)
    raise "Non exist!" unless include?(num)
    i = num % 20
    subarr = @store[i]
    subarr.each do |num|
      subarr.delete(num) if num == num
    end
    @store
  end

  def include?(num)
    i = num % 20
    subarr = @store[i]
    subarr.each do |num|
      return true if num == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

    return if include?(num)
    @count += 1
    resize! if @count > @store.length

    i = num % num_buckets
    @store[i] << num
  end

  def remove(num)
    return unless include?(num)
    i = num % num_buckets
    subarr = @store[i]
    subarr.each do |int|
      if int == num
        subarr.delete(num)
        @count -= 1
      end
    end
  end

  def include?(num)
    i = num % num_buckets
    subarr = @store[i]
    subarr.each do |int|
      return true if int == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2){ Array.new }
    @store.flatten.each do |num|
        i = num % new_store.length
        new_store[i] << num
    end
    @store = new_store
  end


end
