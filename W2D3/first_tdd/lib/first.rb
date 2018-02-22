class Array
  def my_uniq

    hash = {}

    self.each do |el|
      hash[el] = true
    end

    hash.keys
    # self.uniq
  end

  def two_sum
    result = []
    hash = Hash.new(0)

    self.each_with_index do |num, i|
      target = -num
      if hash.has_key?(target)
        result << [hash[target], i]
      else
        hash[num] = i
      end
    end
    result.sort
    # result = []
    # arr.each_with_index do |n1, idx1|
    #   arr.each_with_index do |n2, idx2|
    #     if idx1 < idx2 && n1 + n2 == 0
    #       result << [idx1, idx2]
    #     end
    #   end
    # end
    #
    # result
  end

end

def my_transpose(arr)
  x = 0
  y = 0

  result = []

  while x < arr[0].length
    y = 0
    tmp = []
    while y < arr.length
      tmp << arr[y][x]
      y += 1
    end
    result << tmp
    x += 1
  end

  result
end


def stock_picker(prices)
  days = []
  profit = nil

  i = 0
  while i < prices.length
    j = i + 1
    while j < prices.length
      if profit.nil? || prices[j] - prices[i] > profit
        profit = prices[j] - prices[i]
        days = [i, j]
      end
      j += 1
    end
    i += 1
  end

  days

end
