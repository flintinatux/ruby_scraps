def equi(a)
  total = a.reduce(:+)
  left_sum = 0
  right_sum = total
  (0..a.size-1).each do |i|
    right_sum -= a[i]
    return i if left_sum == right_sum
    left_sum += a[i]
  end
  return -1
end

a = [0]

puts equi a