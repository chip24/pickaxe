FACTORS = [
    ["m", 1000], ["cm", 900], ["d", 500], ["cd", 400],
    ["c", 100], ["xc", 90], ["l", 50], ["xl", 40],
    ["x", 10], ["ix", 9], ["v", 5], ["iv", 4],
    ["i", 1]
]

def romanization(value)
    roman = ""
    FACTORS.each do |code, factor|
        #puts "The code is #{code} and the factor is #{factor}."
        count, value = value.divmod(factor)
        puts "The count is #{count} and the factor is #{factor}."
        roman << (code * count)
    end
    roman
end

p (400).divmod(4)
p (4).divmod(400)

puts romanization(9)
puts romanization(3)

int1 = 45
int2 = 4*3-3+5
int3 = 4**3
int4 = -5

puts "#{int1.divmod(5)}"
puts "#{int2.divmod(3)}"
puts "#{int3.divmod(7)}"
puts "#{int4.divmod(1)}"
