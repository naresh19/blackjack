$:.unshift("#{File.dirname(__FILE__)}") # add source directory to path
require_relative 'card'
require_relative 'constants'
include Constants

=begin rdoc
This class represents a playing card deck that the dealer deals
from. Since there is only player 6 Deck have enough cards for the game
to end.
=end

class Deck
    attr_accessor :cards
    def initialize
      @cards = create_52_card_deck
    end

    private
    def create_52_card_deck
      fresh_cards = []
      SUITS.each do |suit,shape|
        FACES.each do |f|
          fresh_cards << Card.new(f,shape)
        end
      end
      fresh_cards
    end

end