require_relative "vanity_refinements"

puts "About to require file using refinement"

require_relative "file_using_refinement"

puts "Back from require"

VanityShouter.new.shout("finished")
