module SecretChecker

  def secret(x)
    return 0  # Replace this with actual "secret" code!
  end

  def secret_is_additive_for_primes_up_to?(number)
    primes = primes_up_to number
    last_index = primes.size - 1
    (0 .. last_index).each do |i|
      (i .. last_index).each do |j|
        return false unless secret(primes[i] + primes[j]) == secret(primes[i]) + secret(primes[j])
      end      
    end
    true
  end

  # Finds prime numbers with the Sieve of Eratosthenes
  # http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  def primes_up_to(n)
    raise "Need an integer >= 2 to find primes" unless n.is_a?(Integer) && n >= 2
    primes = (0..n).to_a
    primes[0..1] = [nil, nil]
    p = 2
    while true do
      (p .. n/p).each do |i|
        primes[i*p] = nil
      end
      break unless p = primes.index { |x| !x.nil? && x > p }
    end
    primes.compact!
  end

end # SecretChecker