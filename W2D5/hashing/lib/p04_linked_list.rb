class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  def initialize
    @list= []
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
  end

  def last
  end

  def empty?
    @list.length == 0
  end

  def get(key)
  end

  def include?(key)
  end

  def append(key, val)
    @list << Node.new(key, val)
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
