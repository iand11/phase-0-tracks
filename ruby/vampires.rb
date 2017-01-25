def employee_questions
	puts "How many employees will be processed?"
	employees_processed = gets.chomp.to_i

	until employees_processed == 0
			
		employees_processed -= 1
		

			current_year = 2017
	
			puts "What is your name?"
			namer = gets.chomp 
		
			puts "How old are you?"
			age = gets.chomp.to_i 
		
			puts "What year were you born?"
			year_born = gets.chomp.to_i 
		
			puts "We have garlic in our cafeteria, should we get some for you? Y/N"
			garlic_answer = gets.chomp.upcase 

			puts "Would you like to enroll in the companies health insurance? Y/N"
			health_insurance = gets.chomp.upcase
			
			puts "List any allergies you have. Once finished type done"
			allergies = gets.chomp 
				until allergies =="done" || allergies == "sunshine"
				puts "any more allergies?"
				allergies = gets.chomp
				end