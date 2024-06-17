class Logger
  def self.add_logging
    def log(msg)
      $stderr.puts("#{Time.now.strftime("%H:%M:%S: ")} #{self} (#{msg})")
    end
  end
end

class Example < Logger
  add_logging
end

class Song < Logger
  add_logging "Song"
end

class Album < Logger
  add_logging "CD"
end

ex = Example.new
puts ex.log("hello")