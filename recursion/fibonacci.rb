def fibonacci(n)
  return 1 if n == 1
  return 0 if n == 0
  fibonacci(n-2) + fibonacci(n-1)
end

def memoization_fib(n, h = {})
  if h[n]
    return h[n]
  end
  return 0 if n == 0
  return 1 if n == 1
  fib_n =  memoization_fib(n - 1, h) + memoization_fib(n - 2, h)
  h[n] = fib_n
  return fib_n
end 
