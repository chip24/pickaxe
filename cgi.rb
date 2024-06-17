require "cgi"

puts CGI.escape("Nicholas Payton/Trumpet & Flugel Horn")

puts CGI.escapeHTML("a < 100 && b > 200")

puts CGI.escapeElement("<hr><a href='/mp3'<Click Here</a><br>", "A")

puts CGI.unescapeHTML("a &lt; 100 &amp;&amp; b &gt; 200")