class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 0

    i = 0
    while i < self.length
      hash = self[i].to_s.ord + (31 * hash)
      i+=1
    end
    hash
  end
end

class String
  def hash
    hash = 0

    i = 0
    while i < self.length
      hash = self[i].ord + (31 * hash)
      i+=1
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    total = 0
    self.each do |k, v|
      hash = 0
      hash = (k.to_s.ord + v.to_s.ord) + (31 * hash)
      total += hash
    end
    total
  end

end
