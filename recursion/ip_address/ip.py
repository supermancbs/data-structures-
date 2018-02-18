def find_valid_ipv4_addrs(input):
  valid_ipv4_addrs = []
  if len(input) < 4 or len(input) > 12:
    return []
  rec_helper(input, [], valid_ipv4_addrs, 3, 0)
  return valid_ipv4_addrs

def rec_helper(input, prefix_octet_array, valid_ipv4_addrs, num_dots_remaining, index):
#   print prefix_octet_array, num_dots_remaining
  # Base case -- found a valid IPv4 address
  print(prefix_octet_array)
  if num_dots_remaining == -1:
    # print("if statement")
    # print('valid_ipv4_addrs', valid_ipv4_addrs)
    # print('prefix_octet_array', prefix_octet_array)
    # print('input', input)
    # print("index", index)
    if index == len(input) and is_valid(prefix_octet_array):
      # print('inside')
      # print('valid_ipv4_addrs', valid_ipv4_addrs)
      # print('prefix_octet_array', prefix_octet_array)
      valid_ipv4_addrs.append('.'.join(prefix_octet_array))
    return

  # Rec Step -- iterating through the rest
  for num_digits_in_octet in range(1, 4): # 1,2,3
    new_octet = input[index:index + num_digits_in_octet]
    # print("input", input)
    # print("index", index)
    # print("num_digits_in_octet", num_digits_in_octet)
    # print('new_octet', new_octet)
    new_prefix_array = [x for x in prefix_octet_array] + [new_octet]
    # print('prefix_octet_array', prefix_octet_array)
    # print("new_prefix_array", new_prefix_array)
    print("done")

    rec_helper(input, new_prefix_array, valid_ipv4_addrs, num_dots_remaining - 1, index + num_digits_in_octet)

def is_valid(prefix_octet_array):
  for octet in prefix_octet_array:
    if not (0 <= int(octet) <= 255) or (octet[0]=='0' and len(octet) != 1): # cover 0 as the prefix
      return False
  return True

print find_valid_ipv4_addrs("2552441013")
