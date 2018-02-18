require 'pry'

def merge(right, left)
  result = []
  while left.length > 0 || right.length > 0
    break if right.empty? || left.empty?
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
  end
  result.concat(left).concat(right)
  return result
end

def merge_sort(arr)
  return arr if arr.length == 1
  left_side = 0
  middle = arr.length / 2
  right_side = arr.length - 1

  merge(merge_sort(arr[left_side...middle]), merge_sort(arr[middle..right_side]))
end
