class MyHash

  def initialize

  end

end

def hash(str)
  hash = 0

  i = 0
  while i < str.length

    hash = str[i].ord + (31* hash)
    i+=1

  end
  hash
end

p hash([1,2])
p hash(33)
