require "erb"

source = <<~SOURCE
<% (min..max).each do |number| %>
    The number is <%= number %>
<% end %>
SOURCE

erb = ERB.new(source)
min = 4
max = 6
puts erb.result(binding)
