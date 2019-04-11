class Computer

    def initialize
        @known_cards = {}
        @matched_cards = {}
    end

    def recieve_revealed_card(pos, val)
        @known_cards[val] = pos
    end

    def recieve_match(pos1, pos2, val)
        @matched_cards[val] = [pos1, pos2]
    end

    
end