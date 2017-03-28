require_relative 'black_jack'
=begin rdoc
This is a executable Class used to create an instance of Blackjack
=end

class Executable

  def self.run_blackjack
    play = 'y'
    while play == 'y'
      b = BlackJack.new
      print "\nDo you want to play more('y' for yes, any other character for no)"
      play = gets.chomp!
    end

  end
end
Executable.run_blackjack