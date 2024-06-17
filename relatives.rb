klass = Integer
print "Inheritance chain: "
begin
  print klass
  klass = klass.superclass
  print " < " if klass
end while klass
puts
p "Ancestors: #{Integer.ancestors}"
p "Subclasses: #{Integer.subclasses}"

class Demo
  @@var = 99
  CONST = 1.23

  private def private_method
  end

  protected def protected_method
  end

  public def public_method
    @inst = 1
    i = 1
    j = 2
    local_variables
  end

  def Demo.class_method
  end
end

def printing(*args)
  args.each do |arg|
    p arg
  end
end

printing(Demo.private_instance_methods(false), Demo.protected_instance_methods(false), Demo.public_instance_methods(false), Demo.singleton_methods(false), Demo.class_variables, Demo.constants(false))

demo = Demo.new
p demo.instance_variables
p demo.public_method
p demo.instance_variables

puts "John Coltrane".send(:length)
puts "Miles Davis".send("sub", /iles/, '.')

trane = "John Coltrane".method(:length)
miles = "Miles Davis".method("sub")

puts trane.call
puts miles.call(/iles/, '.')

def double(a)
  2 * a
end

method_object = method(:double)
p [1,3,5,7].map(&method_object)

unbound_length = String.instance_method(:length)
class String
  def length
    99
  end
end

str = "cat"
puts str.length

bound_length = unbound_length.bind(str)
puts bound_length.call

trane = %q{"John Coltrane".length}
miles = %q{"Miles Davis".sub(/iles/, '.')
}

puts eval(trane)
puts eval(miles)

def get_a_binding
  val = 123
  binding
end

val = "cat"

the_binding = get_a_binding
puts eval("val", the_binding)
puts eval("val")


