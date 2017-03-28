require_relative 'card'
require_relative 'constants'
include Constants

=begin rdoc
This class represents a playing card. It has a value as per
standard Blackjack rules, as well as a string representation for
printing.
=end

class Card
    attr_reader :value, :face,:suit

    def initialize(face,suit)
        @face = face
        @suit = suit
        case face
        when (2..10) then @value = face.to_i
        when "J" then @value = 10
        when "Q" then @value = 10
        when "K" then @value = 10
        when "A" then @value = 11
        end
    end


end
