require_relative "csv_reader"

reader = CsvReader.new

=begin
ARGV.each do |csv_file_name|
    $stderr.puts "Processing #{csv_file_name}"
    reader.read_in_csv_data(csv_file_name)
end
=end

reader.read_in_csv_data("data.csv")
p reader.books_in_stock
puts "Total value = #{reader.total_value_in_stock}"