require_relative 'dealer'
require_relative 'player'
require_relative 'constants'

=begin rdoc
This Class represents the blackjack game
The +play_game+ function implements the game algorithm. A brief outline follows:
* for each round of the game
    * each player and the dealer himself start out with a clean hand (i.e., no cards
      and no bets)
    * the dealer asks player to place a bet on their hand
    * the dealer deals out two initial cards to player
    * the dealer deals himself one card
    * for each player and each hand, the dealer
    * asks the player to choose an action.
    * updates the player's hand depending on the chosen action
    * the dealer then finishes dealing himself cards until he stands at 17
    * the dealer then settles any bets depending on the result

=end

class BlackJack

  attr_reader :player,:dealer,:status,:number_of_deck,:cards

  def initialize
    @player = Player.new(1)   #1 here is id  so that later if we have multiple player we can identify players by id
    @dealer = Dealer.new
    @status = GAME_STATUSES["in_progress"]
    @number_of_deck = NUMBER_OF_DECK
    @cards = []
    start_game
  end

  def start_game
    print_greeting_message
    setup_game
    play_game
    #print_state

  end

  def setup_game
    get_all_cards
    @cards.shuffle!
    @player.set_player_bet
  end

  def get_all_cards
    @number_of_deck.times do |i|
      @cards += (Deck.new.cards)
    end
  end

  def print_greeting_message
    puts "----- STARTING A NEW GAME OF BLACKJACK------\n"\
    "Shuffling cards....\n"\

  end

  def blackjack?
    @player.blackjack? || @dealer.blackjack?
  end

  def declare_winner
    puts "Player #{@player.id} has a blackjack!" if blackjack?
    puts "Player #{@player.id} wins"
    game_over
  end

  def game_over
    @status = GAME_STATUSES["over"]
  end

  def play_game
    deal_initial_cards
    print_state
    #check_for_winner
    player_stand = false
    while(!player_stand && !@player.lost_or_won?)
      puts "Please make a choice"
      puts "Press '#{STAND_KEY}' for #{KEY_DESCR_MAP[STAND_KEY]}, '#{HIT_KEY}' for #{KEY_DESCR_MAP[HIT_KEY]}"
      action = gets.chomp
      case action
        when STAND_KEY
          player_stand = true
        when HIT_KEY
          @player.pick_cards @cards.pop
          print_state
        else
          puts "no such action, try again..."
      end
    end

    if !@player.lost_or_won?
      play_dealer
    end
    declare_result
    game_over
  end

  def declare_result

    puts "<<======================================================>>\n"
    puts "\tPlayer Score : #{@player.score} Dealer Score : #{@dealer.score} "
    if (@player.score < @dealer.score && @dealer.score <= 21) || @player.score > 21 # Dealer Wins
      puts "\tPlayer got bust with deck worth #{@player.score}" if @player.score > 21
      puts "\tDealer has a Blackjack!" if @dealer.blackjack?
      puts "\tDealer wins with deck worth #{@dealer.score}"
    elsif (@dealer.score < @player.score && @player.score <= 21) || @dealer.score > 21  # Player Wins
      puts "\tDealer got bust with deck worth #{@dealer.score}" if @dealer.score > 21
      puts "\tPlayer #{@player.id} has a blackjack!" if @dealer.blackjack?
      puts "\tPlayer #{@player.id} Wins with deck worth #{@player.score}"
    elsif @player.score == @dealer.score
      puts "Game ends in a Draw \n Player #{@player.id} has deck worth #{@player.score} and Dealer has deck worth #{@dealer.score}"
    end
    puts "<<======================================================>>\n"

  end

  def play_dealer
    puts "Dealer's turn to take cards now"
    while(@dealer.score<= 16)
      @dealer.pick_cards @cards.pop
    end
    print_state
  end

  def deal_initial_cards
    2.times{ @player.pick_cards @cards.pop }
    @dealer.pick_cards @cards.pop
  end

  def print_state()
    puts "------- CURRENT STATE ---------"
    puts "DEALER: #{print_cards(@dealer.cards)} "
    puts "\t cards: \t #{print_cards(@dealer.cards)}"
    puts "\t score: \t #{@dealer.score}"
    puts "PLAYER #{@player.id}"
    puts "\t bet: \t\t #{@player.bet}"
    puts "\t cards: \t #{print_cards(@player.cards)}"
    puts "\t score: \t #{@player.score}"
    puts "\n------ CURRENT STATE END ---------"
  end

  def print_cards cards
    cards.map{|card| "#{card.face}"}.join(' ')
  end

end
b = BlackJack.new
#p b.cards