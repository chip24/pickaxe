module Humor
  def tickle
    puts "#{self} says hee, hee!"
  end
end

class Grouchy
  extend Humor
end

Grouchy.tickle

module VanityPuts
  refine Object do
    private def puts(*args)
      args.each do |arg|
        Kernel.puts("Dave says: #{arg}")
      end
    end
  end
end

class DavesStuff
  using VanityPuts
  puts "Hello, world"

  def greet(msg)
    puts msg
  end
end

DavesStuff.new.greet("in DavesStuff")

