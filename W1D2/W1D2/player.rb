class Player
    def initialize
        
    end
    def prompt
        print "Give two numbers: "
    end
    def get_input
        pos_str = gets.chomp
        [pos_str.to_i, pos_str[2].to_i]
    end
end
