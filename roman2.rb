class Roman

  def initialize(value)
    @value = value
  end

  def coerce(other)
    if Integer === other
      [other, @value]
    else 
      [Float(other), Float(@value)]
    end
  end
end

iv = Roman.new(4)
xi = Roman.new(11)

puts 3 * iv
puts 1.2 * xi