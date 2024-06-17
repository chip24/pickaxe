"banana" in "banana"
"banana" in "apple"
3 in 3
3 in 5
2i in 2i
3 in 33

"value" in String => a
puts a

[1, "potato", 2, "potato"] => [first, String, second, String]
puts "the numbers are #{first} and #{second}"

{rank: "Ace", suit: "Hearts"} => {rank:, suit:}
puts "Your card is the #{rank} of #{suit}."

def pick_a_card(cards)
    case cards
        in [*, {rank: "Ace", suit: String => s}, *]
        "You have an Ace!  Its suit is #{s}."
        in [*, {rank: r, suit: "Diamonds"}, *]
        "You have a Diamond! Its rank is #{r}."
        in [*, {rank:"Queen", suit:}, *]
        "You have a Queen.  Its suit is #{suit}."
    else
        "You have no interesting cards,"
    end
end

puts pick_a_card([
    {rank: "Ace", suit: "Hearts"},
    {rank: "King", suit: "Diamonds"},
    {rank: "Queen", suit: "Clubs"}
])

def pick_a_card_better(rank_to_look_for, suit_to_look_for, cards)
    case cards
    in [*, {rank: ^rank_to_look_for, suit:}, *]
        puts "You have a #{rank_to_look_for}! It's suit is #{suit}."
    in [*, {rank:, suit: ^suit_to_look_for}, *]
        puts "You have a #{rank}! Its suit is #{suit_to_look_for}."
    else
        puts "You have no interesting cards."
    end
end

puts pick_a_card_better("King", "Clubs", [
    {rank: "Ace", suit: "Hearts"},
    {rank: "King", suit: "Diamonds"},
    {rank: "Queen", suit: "Clubs"}
    ])
    
def pick_a_card_best(cards)
    case cards
    in [*, {rank: }, {rank: ^rank},*]
        "You have a pair of #{rank}s."
    else
        "You have no interesting cards."
    end
end

puts pick_a_card_best([
    {rank: "Ace", suit: "Hearts"},
    {rank: "Ace", suit: "Diamonds"},
    {rank: "Queen", suit: "Clubs"}
])

def pick_a_card_pin(cards)
    cards = cards.sort_by {_1[:rank]}
    case cards
    in [{rank:}, {rank: ^(rank + 1)}, {rank: ^(rank + 2)}]
        "You have three consecutive cards."
    else
        "You have no interesting cards."
    end
end

puts pick_a_card_pin([
    {rank: 7, suit: "Hearts"},
    {rank: 8, suit: "Diamonds"},
    {rank: 9, suit: "Clubs"}
    ])

def pick_a_card_guard(cards)
    cards = cards.sort_by {_1[:rank]}
    case cards
    in [{rank:}, {rank: ^(rank + 1)}, {rank: ^(rank + 2)}] if rank > 6
        "You have three consecutive high cards"
    else
        "You have no interesting cards."
    end
end

puts pick_a_card_guard([
    {rank: 7, suit: "Hearts"},
    {rank: 8, suit: "Diamonds"},
    {rank: 9, suit: "Clubs"}
    ])


