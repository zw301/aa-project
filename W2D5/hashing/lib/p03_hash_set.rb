require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if include?(key)
    @count += 1
    resize! if @count > @store.length

    i = key.hash % num_buckets
    @store[i] << key
  end

  def include?(key)
    i = key.hash % num_buckets
    subarr = @store[i]
    subarr.each do |int|
      return true if int == key
    end
    false
  end

  def remove(key)
    return unless include?(key)
    i = key.hash % num_buckets
    subarr = @store[i]
    subarr.each do |int|
      if int == key
        subarr.delete(key)
        @count -= 1
      end
    end
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
