Note = Struct.new(:value) do
  def to_s
    value.to_s
  end
end

class Chord
  def initialize(arr)
    @arr = arr
  end

  def play
    @arr.join("-")
  end
end

c = Chord.new(
  [
    Note.new("G"),
    Note.new("Bb"),
    Note.new("Dd"),
    Note.new("E")
  ]
)

File.open("posterity", "w+") do |f|
  Marshal.dump(c, f)
end

chord = Marshal.load(File.open("posterity"))
chord.play