
class RockPaperScissors
 
 WINS = {R: :S, P: :R, S: :P}
 
def initialize
  @playerScore = 0
  @computerScore = 0
end
 
 NAMES = {R: "Rock", P: "Paper", S: "Scissors", I: "Impossible"}
 
 RESULTS = {
   :player => "You won the round!",
   :computer => "Computer wins the round!",
   :invalid => "Invalid choice pick again",
   nil => "A tie!"
 }
 

 def start
   @winner = nil
   while @winner!=""
   play_a_round
   end
 end
 
 
 def play_a_round
   prompt
   get_player_play
   get_computer_play  
   get_winner
   print_and_turn
 end
 
 def get_player_play
   @player_play = gets.chomp.upcase.to_sym 
   @winner = :invalid if ![:R, :P, :S].include?(@player_play)
   @winner = :score if @player_play == :X
   @winner = "" if @player_play == :Q
   @winner = require_relative "impossible.rb" if @player_play == :I
 end


 def prompt
   puts "What would you like to do? (r: Rock, p: Paper, s: Scissor, x: Score, q: Quit)"
 end
 
 def get_computer_play
   @computer_play = WINS.keys.sample
 end
 
 def get_winner
  if @player_play == @computer_play then @winner = nil
  else
  @winner = :player   if WINS[@player_play] == @computer_play 
  @winner = :computer if WINS[@computer_play] == @player_play  
  end
 end
 
  def print_state 
  @winner == :score ? (puts print_score) : (puts RESULTS[@winner]) 
  (@playerScore += 1) if @winner == :player 
  (@computerScore += 1) if @winner == :computer 
  end

def round_score
  puts "You played: #{NAMES[@player_play]} and Computer played: #{NAMES[@computer_play]}!"
end

def print_and_turn
  print_state
  turn
 end

def turn
  @winner == :player || @winner == :computer ? (round_score) : nil
end

 def print_score
  "The score is: You:#{@playerScore} VS Computer:#{@computerScore}"
 end

   
end

RockPaperScissors.new.start