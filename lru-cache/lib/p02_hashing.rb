class Fixnum

  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = []
    self.each do |el|
      num = el.hash
      result<<(num%1000).to_s
    end
    result.join.to_i
  end
end

class String
  def hash
    result = []
    self.each_char do |char|
      letter = char.ord.hash
      result<<(letter%1000).to_s
    end
    result.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k, v|
      key = (k.hash % 10_000).to_s
      value = (v.hash % 10_000).to_s
      result += (key + value).to_i
    end

    result
  end
end
