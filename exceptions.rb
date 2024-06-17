require 'open-uri'

URI.open("https://pragprog.com/news/index.html") do |web_page|
    output = File.open("index.html", "w")
    begin
        while (line = web_page.gets)
            output.puts line
        end
    rescue StandardError
        $stderr.warn "Failed to download #{file_name}: #{$!}"
        output.close
        File.delete(file_name)
        raise
    end
end