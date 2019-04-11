require_relative "board"
require_relative "player"

class Game
    attr_reader :player
    def initialize
        @board = Board.new
        @board.populate
        @previous_pos = []
        @player = Player.new
    end

    def play
        while !@board.won?
            system("clear")
            @board.render
            pos = guess
            @board.reveal(pos)
            @previous_pos = pos
            system("clear")
            @board.render
            pos = guess
            @board.reveal(pos)
            system("clear")
            @board.render
            unless @board.reveal(pos) == @board.reveal(@previous_pos)
                @board.hide(pos) 
                @board.hide(@previous_pos)
                sleep(1)
            end
        end
        puts "You won!!!!"
    end
    def guess
        player.prompt
        pos = player.get_input
        while(!valid_guess?(pos))
            player.prompt
            pos = player.get_input
        end
        pos
    end
    def valid_guess?(pos)
        if @board.card_at(pos).face_up
            false
        else
            true
        end
    end
end


