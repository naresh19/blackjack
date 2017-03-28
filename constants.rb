=begin rdoc
module defines constants for Blackjack classes.
=end

module Constants
    GAME_STATUSES = {"in_progress" => "InProgress","over" => "Over"}
    NUMBER_OF_DECK = 6

    STAND_VALUE = 17
    BLACKJACK_VALUE = 21

    FACES = [2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]
    SUITS = {"clubs"=> "♣", "diamonds"=> "♦", "hearts"=> "♥", "spades"=> "♠"}
    STAND_KEY = "s"
    HIT_KEY = "h"
    KEY_DESCR_MAP = {STAND_KEY => "stand",HIT_KEY => "hit"}
end
