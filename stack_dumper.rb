def dump_call_stack
  file_contents = {}
  puts "File                  Line    Source Line"
  puts "---------------------------------------------------"
  caller.each do |position|
    match_data = position.match(/\A(.*?):(\d+)/)
    next if match_data.nil?
    file = match_data[1]
    line = Integer(match_data[2])
    file_contents[file] ||= File.readlines(file)
    printf("%-15s:%3d - %s", File.basename(file), line, file_contents[file][line -1].lstrip)
  end
end

