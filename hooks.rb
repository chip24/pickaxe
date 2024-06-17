class Object
  old_system_method = instance_method(:system)

  define_method(:system) do |*args|
    old_system_method.bind_call(self, *args).tap do |result|
      puts "system(#{args.join(', ')}) returned #{result.inspect}"
    end
  end
end
system("date")
system("kangaroo", "-hop 10", "skippy")

module SystemHook
  private def system(*args)
    super.tap do |result|
      puts "system(#{args.join(', ')}) returned #{result.inspect}"
    end
  end
end

class Object
  prepend SystemHook
  attr_accessor :timestamp
end

system("date")
system("kangaroo", "-hop 10", "skippy")

class Class
  old_new = instance_method(:new)
  define_method(:new) do |*args, **kwargs, &block|
    result = old_new.bind_call(self, *args, **kwargs, &block)
    result.timestamp = Time.now unless result.is_a?(Time)
    result
  end
end

class Test
end

obj1 = Test.new
sleep(0.002)
obj2 = Test.new
puts obj1.timestamp.to_f
puts obj2.timestamp.to_f

def cat_a
  puts caller[0..2]
end

def cat_b
  cat_a
end

def cat_c
  cat_b
end

cat_c