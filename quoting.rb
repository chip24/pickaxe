print <<HERE
Doubled quoted
here document.
It is #{Time.now}
HERE

print <<-'THERE'
  This is a single quoted.
  The above used #{Time.now}
THERE