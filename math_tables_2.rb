print "Choose 't' for times or 'p' for plus."
operator = gets
print "your number is: "
number = Integer(gets)

if operator.start_with?("t")
    calc = -> (n) { n * number }
else
    calc = -> (n) { n + number }
end
puts ((1..10).map(&calc).join(", "))