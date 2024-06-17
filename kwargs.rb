def header(name, level:, upper: false)
  name = name.upcase if upper
    "<h#{level}>#{name}<H#{level}>"
end

puts header("Introduction", level: 1)
puts header("Getting started", level: 2)
puts header("Conclusion", upper: true, level: 1)