class Card
    attr_reader :face_up, :face_value

    def initialize(face_value)
        @face_value = face_value
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def to_s
        @face_value
    end

    def ==(other_card)
        return true if @face_value == other_card.to_s
    end
end

