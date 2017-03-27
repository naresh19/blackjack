require_relative 'deck'
require_relative 'constants'
include Constants

=begin rdoc
This class represents the Blackjack dealer.I choose to have a separate
class for the Dealer because a dealer behave differently than players
also it will be easy to maintain code if this application is extended
for multiple players.
=end

class Dealer
  attr_reader :cards,:score
  def initialize()
    @cards = []
    @score = 0
  end


  def pick_cards card
    cards << card
    @score += card.value
  end


  def blackjack?
    @score == 21
  end
end
