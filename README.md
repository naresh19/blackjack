*** Simple Blackjack Game ***

This is an implementation of Blackjack in Ruby with the following rules:
    1. Dealer give two random cards to the player and 1 card to himself. All cards are visible
       to everyone

    2. If the player gets a score of 21, let us call this black jack (e.g. Ace + Jack), the
       player wins. If the score is greater than 21, the player loses. If the score is less than 21, move to step 3.

    3. Player makes a decision
       a. Hit(h) - If the player chooses hit, the dealer will deal another card to the player, go back to Step 2

       b. Stand(s) - No more card to be dealt to the player, Move to step 4

    5. Now the dealer will deal another card to himself. If the dealer gets a score of 21, the
       dealer wins. If the dealer crosses 21 (bust), player wins. If the score is <=16 repeat Step 5 (i.e. deal another card). If the score is >= 17 go to step 5

    6. Compare the scores of the player and the dealer, whoever has a greater score wins


Code is written to be self-documenting and as close as possible to idiomatic English.

To Rub this application
    ruby blackjack.rb


### Requirements
Implement a simple game of blackjack. It should employ a basic command-line interface. The program should begin by asking how many players are at the table, start each player with $1000, and allow the players to make any integer bet for each deal.

Objective-:  Implement a fairly simplified version of the black jack game with one dealer and one player.
