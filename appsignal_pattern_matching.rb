case [1,2,"Three"]
    in [Integer, Integer, String]
    puts "matches first"
    in [1,2,"Three"]
    puts "matches second"
    # * is a spread operator which matches anything
    in [Integer, *]
    puts "matches third"
    in [a, *]
    puts "matches fourth"
end

case { a: 1, b: 2 }
    in {a: Integer }
    puts "matches: by default all object matches are partial"
    in { a: Integer, ** }
    puts "matches: is the same as {a: Integer}"
    in {a: a}
    puts "matches: and the value or the varialbe a is now 1"
    in {a: Integer => a }
    puts "matches: as the value of the variable a is now 1 too"
    in { a: 1, b: b }
    puts "matches: and the value of varialbe b is now 2"
    in { a: Integer, **nil}
    puts "does not match: it will only match if the object has 'a' and no other keys"
end

def greet(hash = {})
    case hash
    in {greeting: greeting, first_name: first_name, last_name: last_name}
        greet(greeting: greeting, name: "#{first_name} #{last_name}")
    in {greeting: greeting, name: name}
        puts "#{greeting}, #{name}"
    in {name: name}
        greet(greeting: "Hello", name: name)
    in {greeting: greeting}
        greet(greeting: greeting, name: "Anonymous")
    else
        greet(greeting: "Hello", name: "Anonymous")
    end
end

greet()
greet(name: "John")
greet(first_name: "John", last_name: "Doe")
greet(greeting: "Bonjour", first_name: "John", last_name: "Doe")
greet(greeting: "Bonjour")

def greet(hash = {})
  case hash
  in {greeting: greeting, first_name: first_name, last_name: last_name}
    greet(greeting: greeting, name: "#{first_name} #{last_name}")
  in {greeting: greeting, name: name}
    puts "#{greeting}, #{name}"
  in {name: name}
    greet(greeting: "Hello", name: name)
  in {greeting: greeting}
    greet(greeting: greeting, name: "Anonymous")
  else
    greet(greeting: "Hello", name: "Anonymous")
  end
end

greet # Hello, Anonymous
greet(name: "John") # Hello, John
greet(first_name: "John", last_name: "Doe") # Hello, John Doe
greet(greeting: "Bonjour", first_name: "John", last_name: "Doe") # Bonjour, John Doe
greet(greeting: "Bonjour") # Bonjour, Anonymous

a = 1
case {a:1, b: 2}
    in {a: ^a}
    puts "matches"
end
p a 

class User
    def deconstruct_keys(keys)
        {first_name: first_name, last_name: last_name}
    end
end

# case user
#in {first_name: "John"}
#    puts "Hey, John"
#end

case [1,2]
in  [a,b] if b == a * 2
    puts "matches"
else
    puts "no match"
end

[1,2,"Three"] => [Integer => one, two, String => three]
puts one
puts two
puts three

# this is the same as the one above
[1,2,"Three"] in [Integer => one, two, String => three]
puts one
puts two
puts three
    



