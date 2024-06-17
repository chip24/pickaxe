def be_polite
  "Why, if it isn't #{self.to_s}?  So glad to see you."
end

class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def to_s = "#{first_name} #{last_name}"

  def introduce
    be_polite
  end
end

clark = Person.new("Clark", "Kent")
p clark.introduce
