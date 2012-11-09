def weighted_random_choice(weights)
  total = weights.reduce(:+)
  choice = Random.rand()
  next = 0
  (0 .. weights.size-1).each do |i|
    next += weights[i] / total
    return i if next >= choice
  end
end

weights = [1.63, 4.59, 0.97, 0.86, 2.61]
puts weighted_random_choice(weights)