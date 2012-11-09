def online_count_mean_and_variance(people)
  sexes = [:male, :female]
  attributes = [:height, :weight]

  count = mean = m2 = {}
  sexes.each do |sex|
    count[sex] = 0.0
    mean[sex] = m2[sex] = {}
    attributes.each do |attribute|
      mean[sex][attribute] = m2[sex][attribute] = 0.0
    end
  end

  people.each do |person|
    sex = person.sex
    count[sex] += 1
    attributes.each do |attribute|
      value = person.send(attribute)
      delta = value - mean[sex][attribute]
      mean[sex][attribute] += delta / count[sex]
      m2[sex][attribute] += delta*(value - mean[sex][attribute])
    end
  end

  variance = {}
  sexes.each do |sex|
    variance[sex] = {}
    attributes.each do |attribute|
      variance[sex][attribute] = m2[sex][attribute] / (count[sex] - 1)
    end
  end
  
  return [count, mean, variance]
end

def save_stats
  stats = {}
  sexes = [:male, :female]
  attributes = [:height, :weight]

  stats[:count, :mean, :variance] = online_count_mean_and_variance(Person.all, sexes, attributes)

  sexes.each do |sex|
    Settings.send("count_of_#{sex}=", stats[:count][sex])
    [:mean, :variance].each do |stat|
      attributes.each do |attribute|
        Settings.send("#{stat}_of_#{sex}_#{attribute}=", stats[stat][sex][attribute])
      end
    end
  end
end