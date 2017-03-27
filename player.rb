
=begin rdoc
This class represents a Blackjack player. I choose to have a separate
class for the Dealer because a dealer behave differently than players
also it will be easy to maintain code if this application is extended
for multiple players
=end

class Player
    attr_reader :id,:cards,:score
    attr_accessor :bet

    def initialize(id)
        @id = id
        @cards = []
        @score = 0
    end

    def set_player_bet
      done = false
      while(!done)
        print "Please enter your bet against dealer: "
        bet = gets.to_i
        if(bet > 0 )
          self.bet = bet
          done = true
        end
      end
    end


    def pick_cards card
      cards << card
      @score += card.value
    end

    def to_s
        "Player #{id}"
    end

    def blackjack?
      @score == 21
    end

    def lost_or_won?
      if @score < 21 # Lost :(
        return false
      else
        return true
      end
    end


end
