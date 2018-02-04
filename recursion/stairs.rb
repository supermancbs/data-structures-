# child can run up either 1, 2, 3 stairs at a time. this is all the combinations

def stairs(n)
    return 1 if n == 1
    return 2 if n == 2
    return 4 if n == 3
    return (stairs(n-1) + stairs(n-2) + stairs(n-3))
end


def stairs_memo(n, memo = {})
    return 1 if n == 1
    return 2 if n == 2
    return 4 if n == 3
    if memo[n]
        return n
    end
    memo[n] = (stairs(n-1) + stairs(n-2) + stairs(n-3))
    return memo[n]
end


def stairs_iterate(n)
  memo = { 1 => 1, 2 => 2, 3 => 4}
  for i in 4..n
      memo[i] = memo[i-1] + memo[i-2] + memo[i-3]
  end
  return memo[n]
end
