


Song = Struct.new(:title, :name, :length)

songs = File.readlines("songdata.txt", chomp: true).map do |line|
    _file, length, name, title = line.chomp.split(/\s*\|\s*/)
    #minutes, secs = length.scan(/\d+/)
    #Song.new(title, name.squeeze(" "), minutes.to_i * 60 + secs.to_i)
    #Song.new(title, name, length)
    minutes, secs = length.scan(/\d+/)
    Song.new(title, name.squeeze(" "), minutes.to_i * 60 + secs.to_i)
end


puts songs[1]
#p songs
