require 'benchmark'


def merge_sort(array)

  return array if array.length <= 1

  left = array.shift(array.length/2)
  right = array

  left = merge_sort(left)
  right = merge_sort(right)

  sorted_list = []

  until left.empty? && right.empty?
    if left.empty?
      sorted_list<<right.shift
    elsif right.empty?
      sorted_list<<left.shift
    elsif left.first < right.first
      sorted_list << left.shift
    else
      sorted_list << right.shift
    end
  end
  return sorted_list
end

def merge_sort_pop(array)

  return array if array.length <= 1

  left = array.pop(array.length/2)
  right = array

  left = merge_sort(left)
  right = merge_sort(right)

  sorted_list = []

  until left.empty? && right.empty?
    if left.empty?
      sorted_list<<right.shift
    elsif right.empty?
      sorted_list<<left.shift
    elsif left.last < right.last
      sorted_list << left.pop
    else
      sorted_list << right.pop
    end
  end
  return sorted_list
end


def create_rand_array(length_of_array= 230)
  stuff =[]
  (length_of_array).times do
    stuff<< rand(200000000)
  end
  stuff
end



stuff= create_rand_array(4000000)
puts "Shift sort #{stuff.length}"

use = stuff.dup
puts Benchmark.measure { merge_sort(use)}
use = stuff.dup

puts Benchmark.measure { merge_sort(use)}
use = stuff.dup

puts Benchmark.measure { merge_sort(use)}
use = stuff.dup
puts "Pop sort #{use.length}"

puts Benchmark.measure { merge_sort_pop(use)}
use = stuff.dup

puts Benchmark.measure { merge_sort_pop(use)}
use = stuff.dup

puts Benchmark.measure { merge_sort_pop(use)}





