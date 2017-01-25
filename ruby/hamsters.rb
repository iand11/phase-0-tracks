puts "What is the hamster's name?"
hamster_name = gets.chomp

puts "What is the volume level of the hamster on a level of 1 - 10?"
volume = gets.chomp.to_i

puts "What is the fur color?"
fur_color = gets.chomp 

puts "Is the hamster a good candidate for adoption? Y/N"
adoption = gets.chomp.upcase!

puts "How old is the hamster?"
age = gets.chomp 
	if age ==""
		age = nil 
	else 
		age.to_i
	end

if age == nil
  puts "confirmed nil"
end 

puts "Hamster name #{hamster_name}
	Volume level is #{volume}
	Fur color is #{fur_color}
	Candidate for adoption #{adoption}
	Hamster age #{age}"