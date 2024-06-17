some_array = [1,2,3,4,5,6,7,8,9]

some_array.each { |value| puts value * 3 }

sum = 0.0
some_array.each do |value|
    sum += value
    puts value
    puts sum
    print "the value #{value} divided by the sum #{sum} equals: " 
    puts (value / sum).to_f
    puts
end

sum = 0
some_array.each do |value|
    square = value * value
    puts "#{value} squared equals #{square}"
    sum += square
end

puts sum

some_array.each { puts _1}

STATE_ABBR_TO_NAME = {
    'AL' => 'Alabama',
    'AK' => 'Alaska',
    'AS' => 'America Samoa',
    'AZ' => 'Arizona',
    'AR' => 'Arkansas',
    'CA' => 'California',
    'CO' => 'Colorado',
    'CT' => 'Connecticut',
    'DE' => 'Delaware',
    'DC' => 'District of Columbia',
    'FM' => 'Federated States Of Micronesia',
    'FL' => 'Florida',
    'GA' => 'Georgia',
    'GU' => 'Guam',
    'HI' => 'Hawaii',
    'ID' => 'Idaho',
    'IL' => 'Illinois',
    'IN' => 'Indiana',
    'IA' => 'Iowa',
    'KS' => 'Kansas',
    'KY' => 'Kentucky',
    'LA' => 'Louisiana',
    'ME' => 'Maine',
    'MH' => 'Marshall Islands',
    'MD' => 'Maryland',
    'MA' => 'Massachusetts',
    'MI' => 'Michigan',
    'MN' => 'Minnesota',
    'MS' => 'Mississippi',
    'MO' => 'Missouri',
    'MT' => 'Montana',
    'NE' => 'Nebraska',
    'NV' => 'Nevada',
    'NH' => 'New Hampshire',
    'NJ' => 'New Jersey',
    'NM' => 'New Mexico',
    'NY' => 'New York',
    'NC' => 'North Carolina',
    'ND' => 'North Dakota',
    'OH' => 'Ohio',
    'OK' => 'Oklahoma',
    'OR' => 'Oregon',
    'PW' => 'Palau',
    'PA' => 'Pennsylvania',
    'PR' => 'Puerto Rico',
    'RI' => 'Rhode Island',
    'SC' => 'South Carolina',
    'SD' => 'South Dakota',
    'TN' => 'Tennessee',
    'TX' => 'Texas',
    'UT' => 'Utah',
    'VT' => 'Vermont',
    'VI' => 'Virgin Island',
    'VA' => 'Virginia',
    'WA' => 'Washington',
    'WV' => 'West Virginia',
    'WI' => 'Wisconsin',
    'WY' => 'Wyoming'
  }

STATE_ABBR_TO_NAME.each {puts "The abbreviation of #{_2} is #{_1}"}


f = File.open("testfile.txt")
f.each_with_index do |line, index|
    puts "Line #{index} is #{line}"
end
f.close 

puts [1,3,5,7].reduce(0) {|sum, element| sum + element}
puts [1.3,5,7].reduce(1) {|sum, element| sum + element}

puts [1,3,5,7].sum

num_arr = [1,3,5,7]
p num_arr.product([2,4,6])

class File
    def self.open_and_process(*args)
        f = File.open(*args)
        yield f
        f.close
    end
end

File.open_and_process("testfile.txt", "r") do |file|
    while line = file.gets
        puts line
    end
end

