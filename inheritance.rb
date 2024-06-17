class Parent
    def say_hello
        puts "Hello from #{self}"
    end
end

p = Parent.new
p.say_hello

class Child < Parent
end

c = Child.new
c.say_hello 

puts Parent.superclass

class Person
    def initialize(name)
        @name = name
    end

    def to_s
        "Person named #{@name}"
    end
end

p = Person.new("Michael")
puts p

def chatty_string(task)
    case task.status
    when "done" then "I'm done"
    when "started" then "I'm not done"
    when "unstarted" then "I haven't even started"
    end
end

class Status
    def self.for(status_string)
        case status_string
        when "done" then DoneStatus.new
        when "started" then StartedStatus.new
        when "defined" then DefinedStatus.new
        end
    end

    def done? = false

    def chatty_string = raise NotImplementedError
end

class DoneStatus < Status
    def to_s = "done"
    
    def done? = true

    def chatty_string = "I'm done"
end

class StartedStatus < Status
    def to_s = "started"

    def chatty_string = "I'm not done"
end

class DefinedStatus < Status
    def to_s = "defined"

    def chatty_string = "I'm not even started"
end

#Status.for(task.status).chatty_string

