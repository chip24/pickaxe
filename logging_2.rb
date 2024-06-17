class Logger
  def self.add_logging(id_string)
    define_method(:log) do |msg|
      now = Time.now.strftime("%H:%M:%S")
      $stderr.puts("#{now}-#{id_string}: #{self} (#{msg})")
    end
  end
end

class Song < Logger
  add_logging "Tune"
end

class Album < Logger
  add_logging "CD"
end

song = Song.new
puts song.log("rock on")

class AttrLogger
  def self.attr_logger(name)
    attr_reader name

    define_method(:"#{name}=") do |val|
      puts "Assigning #{val.inspect} to #{name}"
      instance_variable_set("@#{name}", val)
    end
  end
end 

class Example < AttrLogger
  attr_logger :value
end

  exa = Example.new
  exa.value = 123
  puts "Value is #{exa.value}"
  exa.value = "cat"
  puts "Value is now #{exa.value}"
