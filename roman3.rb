class Roman
  MAX_ROMAN = 4999

  attr_reader :value
  protected :value

  def initialize(value)
    if value <= 0 || value > MAX_ROMAN
      fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
    end
    @value = value
  end

  def coerce(other)
    if Integer === other
      [other, @value]
    else
      [Float(other), Float(@value)]
    end
  end

  def +(other)
    if Roman === other
      other = other.value
    end
    if Integer === other && (other + @value) < MAX_ROMAN
      Roman.new(@value + other)
    else
      x, y = other.coerce(@value)
      x + y
    end
  end

  FACTORS = [["m", 1000], ["cm", 900],    ["d", 500], ["cd", 400],
  ["c", 100], ["xc", 90], ["l", 50], ["xl", 40],
  ["x", 10], ["ix", 9], ["v", 5], ["iv", 4],
  ["i", 1]]

  def to_s
    value = @value
    roman = ""
    FACTORS.each do |code, factor|
      count, value = value.divmod(factor)
      roman << (code * count)
    end
    roman
  end
end

iv = Roman.new(4)
xi = Roman.new(11)

puts iv + 3
puts iv + 3 + 4
puts iv + 3.14159
puts xi + 4900
puts xi + 4990
