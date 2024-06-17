class Card
    attr_accessor :rank, :suit

    def initialize(rank, suit)
        @rank = rank
        @suit = suit
    end

    def deconstruct_keys(keys)
        {rank:, suit:}
    end
end

def pick_a_card(cards)
    cards = cards.sort_by(&:rank)
    case cards
    in [{rank:}, {rank: ^(rank + 1)}, {rank: ^(rank + 2)}] if rank > 6
        "You have three consecutive high cards."
    else
        "You have no interesting cards."
    end
end
puts pick_a_card([
    Card.new(7, "Hearts"),
    Card.new(8, "Diamonds"),
    Card.new(9, "Clubs")
])
