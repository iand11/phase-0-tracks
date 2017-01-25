def employee_questions
	puts "How many employees will be processed?"
	employees_processed = gets.chomp.to_i

	until employees_processed == 0
			
		employees_processed -= 1
		

			current_year = 2017
	
			puts "What is your name?"
			name = gets.chomp 
		
			puts "How old are you?"
			age = gets.chomp.to_i 
		
			puts "What year were you born?"
			year_born = gets.chomp.to_i 
		    
		    valid_input = false 
		    until valid_input
			puts "We have garlic in our cafeteria, should we get some for you? Y/N"
			garlic_answer = gets.chomp.upcase 
				if garlic_answer == "Y" || garlic_answer == "N"
					valid_input = true 
				else
					puts "Please type Y or N"
				end

			end

			valid_input = false 
		    until valid_input
			puts "Would you like to enroll in the companies health insurance? Y/N"
			health_insurance = gets.chomp.upcase
				if health_insurance == "Y" || health_insurance == "N"
					valid_input = true 
				else
						puts "Please type Y or N"
				end

			end

		
			puts "List any allergies you have. Once finished type done"
			allergies = gets.chomp 
				until allergies =="done" || allergies == "sunshine"
				puts "any more allergies?"
				allergies = gets.chomp
				end

			if name == "Drake Cula" || name == "Tu Fang" && age = current_year - year_born && garlic_answer == "Y" && health_insurance == "Y"
				puts "Def Vamp"
		
			elsif age != current_year - year_born && garlic_answer == "N" || health_insurance == "N"
				puts "Probably a vampire"
		
			elsif age != current_year - year_born && garlic_answer == "N" && health_insurance == "N"
				puts "Almost certainly a vampire"
		
			elsif age = current_year - year_born && garlic_answer == "Y" && health_insurance == "Y" && allergies =="done"
				puts "Probably not a vampire"
			
			elsif allergies == "sunshine"
				puts "Probably a vampire"
				
			else 
				puts "Results inconclusive"
				
			end
	end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
end