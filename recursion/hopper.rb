# write a function to return the minimum number of
# jumps to reach the end of the array (starting from the first element)
# [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9
def helper(arr, i, mins)
  return mins[i] if mins[i]
  return 0 if i >= arr.length
  return 'fail' if arr[i] == 0
  min = 99999

  for j in i+1..i+arr[i]
    jumps_count = helper(arr, j, mins)
    if jumps_count != 'fail' && jumps_count < min
      min = jumps_count + 1
    end
  end
  mins[i] = min
  min
end

def hopper_dynamic(arr)
  mins = []
  arr.length.times do
    mins << false
  end
  helper(arr, 0, mins)
end


def hopper_recursion(arr, i = 0)
  return 0 if i >= arr.length
  return 'fail' if arr[i] == 0
  min = 999999

  for j in i+1..i+arr[i]
    jumps_count = hopper_recursion(arr, j)
    if jumps_count != 'fail' && jumps_count < min
      min = jumps_count + 1
    end
  end
  return min
end
