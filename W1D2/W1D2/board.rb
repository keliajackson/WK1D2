require_relative "card"
require "byebug"
class Board

    def initialize
        @grid = Array.new(4) {Array.new(4) }
        @card_values = ["a", "a", "b", "b", "c", "c", "d", "d", "e", "e", "f", "f", "g", "g", "h", "h"]
    end
    def card_at(pos)
        @grid[pos[0]][pos[1]]
    end

    def get_random_pos
        rng = Random.new 
        new_arr = []
        2.times{new_arr << rng.rand(4)}
        new_arr
    end

    def populate
        
        16.times do |i|
            pos = get_random_pos
            while @grid[pos[0]][pos[1]] != nil
                pos = get_random_pos
            end
            @grid[pos[0]][pos[1]] = Card.new(@card_values[i])

        end
    end
    def render
        puts "  0 1 2 3"
        @grid.each_with_index do |row,idx|
            print idx.to_s + " "
            row.each do |card|
                if card.face_up
                    print card.to_s + " "
                else
                    print "  "
                end
            end
            puts ""
        end
    end
    #guessed_pos = [0,1]
    def reveal(guessed_pos)
        @grid[guessed_pos[0]][guessed_pos[1]].reveal
        @grid[guessed_pos[0]][guessed_pos[1]].to_s
    end

    def hide(guessed_pos)
        @grid[guessed_pos[0]][guessed_pos[1]].hide
    end

    def won?
        @grid.all? do |row|
            row.all? do |card|
                true if card.face_up
            end
        end
    end
end



