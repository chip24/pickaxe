print "Choose 't' for times or 'p' for plus."
operator = gets
print "your number is: "
number = Integer(gets)

method = number.method(operator.start_with?("t") ? :* : :+)
puts ((1..10).map(&method).join(", "))


