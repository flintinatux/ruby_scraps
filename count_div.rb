def count_div ( a,b,k )
  # Simple cases
  return 0 if k > b
  return 0 if a == b != k
  return 1 if a == b == k

  # Skip-over case
  n = a / k
  return 0 if n*k < a && (n+1)*k > b

  # Only one in range
  range = b - a
  return 1 if (a <= (n+1)*k <= b) && (k > range)

  # Count the ones in range
  range / k + 1
end