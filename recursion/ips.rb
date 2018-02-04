def find_valid_ipv4_addrs(input):
  valid_ipv4_addrs = []
  if len(input) < 4 or len(input) > 12:
    return []
  rec_helper(input, [], valid_ipv4_addrs, 3, 0)
  return valid_ipv4_addrs

def rec_helper(input, prefix_octet_array, valid_ipv4_addrs, num_dots_remaining, index):
#   print prefix_octet_array, num_dots_remaining
  # Base case -- found a valid IPv4 address
  if num_dots_remaining == -1:
    if index == len(input) and is_valid(prefix_octet_array):
      valid_ipv4_addrs.append('.'.join(prefix_octet_array))
    return

  # Rec Step -- iterating through the rest
  for num_digits_in_octet in range(1, 4): # 1,2,3
    new_octet = input[index:index + num_digits_in_octet]
    new_prefix_array = [x for x in prefix_octet_array] + [new_octet]
    rec_helper(input, new_prefix_array, valid_ipv4_addrs, num_dots_remaining - 1, index + num_digits_in_octet)

def is_valid(prefix_octet_array):
  for octet in prefix_octet_array:
    if not (0 <= int(octet) <= 255) or (octet[0]=='0' and len(octet) != 1): # cover 0 as the prefix
      return False
  return True

print find_valid_ipv4_addrs("2552441013")


#
# Your last Ruby code is saved below:
# # Valid IPv4 addresses
#
# # Definition of valid:
# # IPv4 should have 4 parts a.b.c.d where 0 <= a,b,c,d <= 255
#
# # Examples:
# # "2552441013" ==> ["255.244.10.13", "255.244.101.3", "255.244.1.013"]
#
# # "1111" ==> ["1.1.1.1"]
# # "12345" ==> ["12.3.4.5", "1.23.4.5" "1.2.34.5", "1.2.3.45"]
# def ips(string, indexes = [1, 2, 3])
#
#   while indexes.last < string.length
#     for i in 0...indexes.length
#       while indexes[i] < indexes[i+1]
#         def checkout
#         end
#
#       end
#     end
#   end
#
# end
