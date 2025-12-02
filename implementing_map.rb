require "./implementing_each_time"

class Array
  def my_map
    arr = []
    my_each { |n| arr << (yield n) }
    arr
  end
end

numbers = [1, 2, 3, 4, 5]

puts numbers.my_map { |n| n + 1 }

