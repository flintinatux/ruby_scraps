def cannonballs ( a,b )
  # Get limits of each array
  amax = a.max
  m = a.size-1

  # Fire off each cannonball
  b.each do |h|
    # Let it bounce off the front end
    next if a[0] >= h

    # Or it may fly over the field
    next if h > amax

    # Let it fly across the field
    (1..m).to_a.each do |i|
      # Find where it lands
      if a[i] >= h
        a[i-1] += 1
        break
      end
    end
  end

  # Return the final map
  a
end