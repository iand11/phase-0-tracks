
#---------------------------------------------------------------------------------
#Class Section

class SoloGame
	attr_reader :player_1_word_hidden, :count, :player_2_guesses, :player_1_word

	def initialize(word)
		@word = word
		@player_1_word = []
		@player_1_word_hidden = []
		@player_2_guesses = []
		@count = 0
	end 

	def get_word
		@player_1_word = @word.split("")
		@player_1_word
	end 
 	
 	def hide_word
		@player_1_word_hidden = @word.split("")
		@player_1_word_hidden.fill("-")
		@player_1_word_hidden
	end 

	def A(letter)
		@player_2_guesses << letter
		return @player_2_guesses
	end

	
	def show_guessed_letter(letter)
		@player_1_word.each_with_index do |item, index|
			if item == letter 
				@player_1_word_hidden.delete_at(index)
				@player_1_word_hidden.insert(index, letter)
			end 
		end
		return @player_1_word_hidden
	end 
end 

#---------------------------------------------------------------------------------
#Driver

puts "Player 1 pick a word"
word = gets.chomp 
game = SoloGame.new(word)
game.get_word
game.hide_word
50.times do 
  puts "|-----------------------------------------------|"
end 

count = 0
 
  puts "Player 2"
  puts "Try and guess the word one letter at a time"
  puts "You have as many guesses as the word has letters"
  puts "Multiple guesses will not be counted against you"

until count >= word.length || !game.player_1_word_hidden.include?("-")
  puts "#{game.player_1_word_hidden}"
  
  letter = gets.chomp
    
    if game.player_1_word.include?(letter)
      puts "Thats one down!"
      count +=1 
    elsif !game.player_1_word.include?(letter) && !game.player_2_guesses.include?(letter)
      puts "Nope, try again"
      count +=1 
    elsif game.player_2_guesses.include?(letter)
      puts "already picked that one"
    end
  game.A(letter)
  game.show_guessed_letter(letter)
end 
puts "#{game.player_1_word_hidden}"

if !game.player_1_word_hidden.include?("-")
  puts "Player 2 wins!!!!"
  puts "Come on Player 1..."
else
  puts "Player 1 wins!!!!"
  puts "Come on Player 2"
end 