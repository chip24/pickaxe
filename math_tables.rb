print "(t)imes or (p)lus?"
operator = gets
print "number: "
number = Integer(gets)

if operator.start_with?("t")
    puts((1..10).collect {|n| n*number}.join(", "))
else
    puts((1..10).collect {|n| n+number}.join(", "))
end

