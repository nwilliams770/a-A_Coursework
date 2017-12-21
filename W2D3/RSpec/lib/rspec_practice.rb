  def my_uniq(array)
    raise ArgumentError if !(array.is_a?(Array))
    arr =[]
    array.each do |el|
      arr << el unless arr.include?(el)
    end
    arr
  end

 def two_sum(array)
   arr=[]
   i = 0
   while i < array.length - 1
     j = i + 1
     if array[i] + array[j] == 0
       arr << [i, j]
     end
     i += 1
   end
   arr
 end


def my_transpose(array)

  arr = Array.new(array.length) { Array.new(array.length) }

  array.length.times do |i|
    array.length.times do |j|
      arr[j][i] = array[i][j]
    end
  end
  arr
end

def wallst_monster(arr)
  i = 0
  best_price = 0
  while i < arr.length - 1
    j = i + 1
    while j < arr.length
      pair = [i,j]
      price = arr[j] - arr[i]

      if arr[j] - arr[i] > best_price
        best_price = price
        best_pair = pair
      end
      j += 1
    end
    i += 1
  end
  best_pair
end
