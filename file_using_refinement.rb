class VanityShouter
  using VanityPuts
  def shout(msg)
    puts(msg.upcase)
  end
end

VanityShouter.new.shout("I'm here!")
