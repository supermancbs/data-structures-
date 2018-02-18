def unique?(s)
  hash = {}
  s.each_char do |char|
    return false if hash[char]
    hash[char] = true
  end
  return true
end
