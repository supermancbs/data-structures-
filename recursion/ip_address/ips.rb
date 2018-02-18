require 'pry'

def find_valid_ipv4_addrs(input)
  valid_ipv4_addrs = []
  if input.length < 4 or input.length > 12
    return valid_ipv4_addrs
  end
  rec_helper(input, [], valid_ipv4_addrs, 3, 0)
  return valid_ipv4_addrs
end

def rec_helper(input, prefix_octet_array, valid_ipv4_addrs, num_dots_remaining, index)
#   print prefix_octet_array, num_dots_remaining
  # Base case -- found a valid IPv4 address
  if num_dots_remaining == -1
    if index == input.length and is_valid(prefix_octet_array)
      valid_ipv4_addrs << prefix_octet_array.join('.')
    end
    return
  end
  # Rec Step -- iterating through the rest
  for num_digits_in_octet in 1..3 # 1,2,3
    new_octet = input[index...(index + num_digits_in_octet)]
    new_prefix_array = prefix_octet_array + [new_octet]
    rec_helper(input, new_prefix_array, valid_ipv4_addrs, num_dots_remaining - 1, index + num_digits_in_octet)
  end
end

def is_valid(prefix_octet_array)
  for octet in prefix_octet_array
    if !(octet.to_i <= 255) or !(octet.to_i >=0) or (octet[0]=='0' and octet.length != 1) # cover 0 as the prefix
      return false
    end
  end
  return true
end


# def iterate(ip)
#   valid_ipv4_addrs = []
#   if input.length < 4 or input.length > 12
#     return valid_ipv4_addrs
#   end
#
#   for index in 0...ip.length
#
#     for num_digits_in_octet in 1..3
#         new_octet = ip[index...(index + num_digits_in_octet)]
#
#     end
#   end
#
# end
# "2552441013" ==> ["255.244.10.13", "255.244.101.3", "255.244.1.013"]
# ["255.244.10.13", "255.244.101.3"]
puts find_valid_ipv4_addrs("2552441013").inspect
