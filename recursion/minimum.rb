

def min_rotation(arr)
  puts arr.inspect

  return arr.first if arr.length == 1

  mid = arr[arr.length/2]
  if arr[0] < mid && mid < arr.last
    return arr[0]
  elsif  arr[0] > mid && mid > arr.last
    return arr[0]
  end

  if arr[0] > mid
    return min_rotation(arr[0..arr.length/2])
  else
    return min_rotation(arr[arr.length/2...arr.length])
  end
end
puts min_rotation([-1, 2, 5, 8, -7, -3])

oldb1 = BucketList.where(first_name: "Leslie", last_name: "Knope").first
oldb1.highlighted = false
oldb1.story = nil

oldb2 = BucketList.where(first_name: "Olivia", last_name: "Pope").first
oldb2.highlighted = false
oldb2.story = nil

oldb3 = BucketList.where(first_name: "Elle", last_name: "Woods").first
oldb3.highlighted = false
oldb3.story = nil

oldb1.save
oldb2.save
oldb3.save


b1 = BucketList.where(first_name: "Kelly", last_name: "Sipan").first
b1.highlighted = true
b1.story = "1"

b2 = BucketList.where(first_name:"Kristy", last_name: "McCray").first
b2.highlighted = true
b2.story = "2"

b3 = BucketList.where(first_name:"Amanda", last_name: "Pellegrino").first
b3.highlighted = true
b3.story = "3"

b1.save
b2.save
b3.save
