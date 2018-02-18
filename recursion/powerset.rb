
def power_set(set)
  return [set] if set.empty?
  last = set.pop
  subset = power_set(set)
  subset + subset.map { |el| el + [last] }
end


puts power_set([1,2]).inspect
