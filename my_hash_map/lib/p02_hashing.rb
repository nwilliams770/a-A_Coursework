class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 675890464890543890 if self.empty?
    hashy = self.map.with_index {|el, idx| el ** idx }
    hash_hashy = (hashy.reduce(:*) * 1000000) % 199
    hash_hashy.to_s.split[0...9].join.to_i
  end
end

class String
  def hash
    return 675890464890543892 if self.length < 1
    hashy = self.chars.map {|el| el.bytes}
    hash_hashy = (hashy.flatten.reduce(:-) * 156978847) % 199
    hash_hashy.to_s.split[0...9].join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash

    0
  end
end
a = [1,2,3,4]
b = [1,2,3,4,5]
c= [1,2,3]

p a.hash
p b.hash
p c.hash
