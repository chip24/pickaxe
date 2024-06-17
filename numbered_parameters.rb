p squares_numbers = (1..10).map { |num| num ** 2 }

p squares_numbers = (1..10).map {_1 ** 2}

city_populations = { "Tokyo" => 37_435_191,
    "Delhi" => 29_399_141, "Shanghai" => 26_317_104 }

city_populations.each {|city, pop| puts "The population of #{city} is #{pop}."}

city_populations.each { puts "The pop. of #{_1} is #{_2}."}

cards = [
    {rank: 7, suit: "Hearts"},
    {rank: 8, suit: "Diamonds"},
    {rank: 9, suit: "Clubs"}
    ]
p cards

sorted_cards = cards.sort_by { |card| card[:rank]}
p sorted_cards

cards_sorted = cards.sort_by { |card| card[:suit]}
p cards_sorted

cards_sorted_num_par = cards.sort_by { _1[:suit]}
p cards_sorted_num_par