
class RockPaperScissors
 
 WIN = {R: :S, P: :R, S: :P}
 
 def initialize
  @playerScore = 0
  @computerScore = 0
 end

 NAME = {R: "Rock", P: "Paper", S: "Scissors"}
 
 RESULT = {
   :invalid => "Invalid choice pick again",
 }


 def start
   @winner = nil
   while @winner!=""
   play_a_round
   end
 end
 
 
 def play_a_round
   get_player_play
   rps
   computer_play
   get_winner
   print_state
 end
 
 def get_player_play
   prompt 
   @player_play = gets.chomp.upcase.to_sym 
   @winner = :invalid if ![:R, :P, :S].include?(@player_play)
   @winner = :score if @player_play == :X
   @winner = "" if @player_play == :Q
 end

 def prompt
   puts "Welcome to your worst nightmare!(r: Rock, p: Paper, s: Scissor, x: Score, q: Quit)"
 end

 def computer_play
   @computer_play = WIN.keys.sample
 end

def rps
  rock
  paper
  scissor
end

def rock
  if @player_play == :R  then puts "You played: Rock, computer played Paper...You Lose"
  else nil
  end
end

def paper
  if @player_play == :P  then puts "You played: Paper, Computer played Scissor...Lose"
  else nil
  end
end

def scissor
  if @player_play == :S  then puts "You played: Scissor, Computer played Rock...Lose"
  else nil
  end
end

 def get_winner
    if @player_play == @computer_play then @winner = nil
 else
  @winner = :player   if WIN[@player_play] == @computer_play 
  @winner = :computer if WIN[@computer_play] == @player_play  
  end
 end
 
 def print_state 
  @winner == :score ? (puts print_score) : (puts RESULT[@winner]) 
  (@computerScore += 1) if @winner == :computer || :player

 end

 def print_score
  "The score is: You:#{@playerScore} VS Computer:#{@computerScore}"
 end
   
end
RockPaperScissors.new.start