require 'sqlite3'
require 'faker'

db = SQLite3::Database.new("reviews.db")

create_table_users = <<-SQL
	CREATE TABLE IF NOT EXISTS users (
		id INTEGER PRIMARY KEY,
		name VARCHAR(255),
		email VARCHAR(255),
		phone INT
	)
SQL

create_table_reviews = <<-SQL 
	CREATE TABLE IF NOT EXISTS reviews (
		id INTEGER PRIMARY KEY,
		user_id INT,
		today_date TEXT,
		mountain_id INT,
		snowing VARCHAR(255),
		powder VARCHAR(255),
		ice VARCHAR(255),
		lines VARCHAR(255),
		sunshine VARCHAR(255),
		comments VARCHAR(255),
		FOREIGN KEY (user_id) REFERENCES users(id),
		FOREIGN KEy (mountain_id) REFERENCES mountains(id)
	)
SQL



create_table_mountains = <<-SQL
	CREATE TABLE IF NOT EXISTS mountains (
	id INTEGER PRIMARY KEY,
	name VARCHAR(255)
	)
SQL


db.execute(create_table_users)
db.execute(create_table_reviews)
db.execute(create_table_mountains)

def add_user(db, name, email, phone)
	db.execute("INSERT INTO users (name, email, phone) VALUES (?,?,?)", [name, email, phone])
end 

# add_user(db, "ian", "ian.driscoll.o@gmail.com", 5166410404)

def add_mountains(db, mountain_name)
	db.execute("INSERT INTO mountains (name) VALUES (?)", [mountain_name])
end

# def add_review(db, snowing, powder, ice, lines, sunshine, comments)
# 	db.execute("INSERT INTO reviews (snowing, powder, ice, lines, sunshine, comments) VALUES (?,?,?,?,?,?)", [snowing, powder, ice, lines, sunshine, comments])
# end  

def add_review(db, user_id, mountain_id, snowing, powder, ice, lines, sunshine, comments)
	db.execute("INSERT INTO reviews (user_id, mountain_id, today_date, snowing, powder, ice, lines, sunshine, comments) VALUES (?,?, date('now'), ?,?,?,?,?,?)", [user_id, mountain_id, snowing, powder, ice, lines, sunshine, comments])
end 


norther_california_mountains = ['kirkwood', 'heavenly', 'northstar', 'squaw', 'homewood', 'sierra_at_tahoe', 'tahoe_donner', 'soda_springs', 'bear_salley', 'sugar_bowl', 'boreal_mountain', 'mammoth', 'china_peak']
# norther_california_mountains.each do |item|
# 	add_mountains(db, item)
# end 

# p db.execute("SELECT * FROM mountains")
# puts db.execute("SELECT * FROM users")

options = ['write a review', 'read reviews from a user', 'read reviews of a mountain', 'see if it is snowing', 'see if there is powder', 'see if there is ice', 'see if there are long lines',]



#-------------------------------------------------------------------------------------------------------------

# DRIVER CODE


user_name=''
user_email=''
user_phone_number=''


#info for users table
puts "Welcome to Northern California Mountain Reviews"
puts "\n"




puts "\n"
puts "\n"


x = ''
anything_esle = ''
user_option = ''

until anything_esle == 'no'

loop do 
puts "Please select what you would like to do from the list below: "
puts "\n"
options.each do |item|
	puts item
end 
user_option = gets.chomp 
break if options.include? user_option
end 


	
	if user_option == "write a review"
		puts "Please enter your name: "
		user_name = gets.chomp
		puts "\n" 
		puts "Please enter your email: "
		user_email = gets.chomp 
		puts "\n"
		puts "Please enter your 10 digit phone number: "
		user_phone_number = gets.chomp
		puts "\n"
		puts "\n"


 
		add_user(db, user_name, user_email, user_phone_number)
		a = db.execute("SELECT * FROM users WHERE name = '#{user_name}' AND email = '#{user_email}' AND phone = '#{user_phone_number}' ")
		user_id_number = a[0][0]
		# p user_id_number
		# puts db.execute("SELECT * FROM users") 
		#info for mountains table
		current_mount = ''
		
		loop do
		puts "#{user_name} please select a mountain from the list:"
		puts "\n"
		puts  norther_california_mountains
		current_mount = gets.chomp 
		break if norther_california_mountains.include? current_mount
		p '|----------------------------------------------------------------------|'
		end 
		
		# 
		x = db.execute("SELECT * FROM mountains WHERE name = '#{current_mount}'")
		mountain_number =  x[0][0]
		mountain_name = x[0][1]
		
		
		#info for reviews table
		puts "\n"
		puts "\n"
		puts "#{user_name} you're at #{mountain_name}"
		puts "Tell me about the mountain..."
		puts "\n"
		
		
		snowing_question =''
		powder_question =''
		ice_question = ''
		lines_question = ''
		sun_question = ''
		
		#snowing
		loop do 
			puts "Is it snowing?"
			snowing_question = gets.chomp.downcase
			break if snowing_question == 'yes' || snowing_question == 'no'
			puts "Please select yes or no"
		end
		
		# #powder
		if snowing_question =='yes'
			powder_question =='yes'
		else 
		  loop do
			puts "Is there powder?"
			powder_question = gets.chomp.downcase
		  break if powder_question == 'yes' || powder_question == 'no'
		    puts "Please select yes or no"
		  end 
		end 
		
		# #ice
		loop do 
			puts "Is there any ice?"
			ice_question = gets.chomp 
			break if ice_question == 'yes' || ice_question == 'no'
			puts "Please select yes or no"
		end 
		
		
		# #long lines
		loop do 
			puts "Are there long lines?"
			lines_question = gets.chomp 
			break if lines_question == 'yes' || lines_question == 'no'
			puts "Please select yes or no"
		end 
		
		
		
		# #sunshine
		loop do 
			puts "Is it sunny?"
			sun_question = gets.chomp 
			break if sun_question == 'yes' || sun_question == 'no'
			puts "Please select yes or no"
		end
		
		
		
		puts "Is there anything you would like to say about the mountain?"
		puts "When done hit enter"
		user_comments = gets.chomp	
		
		
		#sending the users answers to the reviews table
		add_review(db, user_id_number, mountain_number, snowing_question, powder_question, ice_question, lines_question, sun_question, user_comments)
		
		see_review = ''
		loop do 
		puts "Would you like to see your review?"
		puts "yes or no"
		see_review = gets.chomp 
		break if see_review == 'yes' || see_review == 'no'
		end 
		
		if see_review == 'yes'
			db.results_as_hash = false
		else 
			db.results_as_hash = true
		end 
		
		puts "\n"
		puts "\n"
		
		if see_review == 'yes'
			current_review =  db.execute("SELECT users.name, mountains.name, reviews.comments, reviews.today_date
							FROM users
							INNER JOIN reviews ON reviews.user_id = users.id
							INNER JOIN mountains ON reviews.mountain_id = mountains.id
							WHERE users.name = '#{user_name}' AND users.email = '#{user_email}' AND users.phone = '#{user_phone_number}'")
			current_review.each do |item|
				puts  item
			end
		end 
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
		

	elsif user_option == 'read reviews from a user'
	loop do 
		selection_of_user = ''
		users_who_wrote_reviews = []
		loop do 
		puts "\n"
		puts "Please select a user"
		puts "\n"
		user_select_method = db.execute("SELECT users.name FROM users JOIN reviews ON reviews.user_id = users.id")
			user_select_method.each do |item|
				users_who_wrote_reviews << item
			end 
		users_who_wrote_reviews.flatten!
		users_who_wrote_reviews.each do |item|
			puts item
		end
		selection_of_user = gets.chomp 
		break if users_who_wrote_reviews.include? selection_of_user
		end 
			if users_who_wrote_reviews.include? selection_of_user 
			specific_user_review = db.execute("SELECT users.name, mountains.name, reviews.comments, reviews.today_date
										FROM users
										INNER JOIN reviews ON reviews.user_id = users.id
										INNER JOIN mountains ON reviews.mountain_id = mountains.id
										WHERE users.name = '#{selection_of_user}'")
			puts "\n"	
			puts "Here are the review(s) from #{selection_of_user}: "
			puts specific_user_review
			end
	puts "\n"			
	puts "Would you like to read another review from a user?"
	puts "yes or no"
	another_user_review = gets.chomp.downcase 
	break if another_user_review == 'no'
	puts "\n"
	puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
	end 

	elsif user_option == 'read reviews of a mountain'
		mountains_with_reviews = []
		loop do
			user_mountain_selection = ''
			until mountains_with_reviews.include? user_mountain_selection
			puts "\n"
			puts "Please select a mountain"
			puts "\n"
			mountain_select_method = db.execute("SELECT mountains.name FROM mountains JOIN reviews ON reviews.mountain_id = mountains.id")
				mountain_select_method.each do |item|
					mountains_with_reviews << item
				end 
			mountains_with_reviews.flatten!
			mountains_with_reviews.each do |item|
				puts item
			end
			user_mountain_selection = gets.chomp
			end  
			specific_mountain_review = db.execute("SELECT users.name, mountains.name, reviews.comments, reviews.today_date
											FROM users
											INNER JOIN reviews ON reviews.user_id = users.id
											INNER JOIN mountains ON reviews.mountain_id = mountains.id
											WHERE users.name = '#{user_mountain_selection}'")
				puts "\n"	
				puts "Here are the review(s) from #{user_mountain_selection}: "
				puts specific_mountain_review
			puts "\n"			
			puts "Would you like to read another review from a user?"
			puts "yes or no"
			another_mountain_review = gets.chomp.downcase 
		break if another_mountain_review == 'no'
		puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
	end 
	
	elsif user_option == 'see if it is snowing'
		snowing_at_mountain_array = []
		snowing_at_mountain = db.execute("SELECT mountains.name
										FROM mountains
										INNER JOIN reviews ON reviews.mountain_id = mountains.id
										WHERE reviews.snowing = 'yes' ")
		snowing_at_mountain.each do |item|
		snowing_at_mountain_array << item
		end 
		snowing_at_mountain_array.flatten!
		if snowing_at_mountain_array.length <= 0
			puts "\n"
			puts "It is not currently snowing at any mountain"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
		else
		snowing_at_mountain_array.each do |item|
			puts "\n"
			puts "\n"
			puts "It has been reported that it is snowing at #{item}"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"

		end

	end 

	elsif user_option == 'see if there is powder'
		powder_at_mountain_array = []
		powder_at_mountain = db.execute("SELECT mountains.name
										FROM mountains
										INNER JOIN reviews ON reviews.mountain_id = mountains.id
										WHERE reviews.powder = 'yes' ")
		powder_at_mountain.each do |item|
		powder_at_mountain_array << item
		end 
		powder_at_mountain_array.flatten!
		if powder_at_mountain_array.length <= 0
			puts "\n"
			puts "There is currently no fresh powder"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
		else
		powder_at_mountain_array.each do |item|
			puts "\n"
			puts "It has been reported that there is powder at #{item}"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
		end

	end 		 
	
	elsif user_option == 'see if there is ice'
		ice_at_mountain_array = []
		ice_at_mountain = db.execute("SELECT mountains.name
										FROM mountains
										INNER JOIN reviews ON reviews.mountain_id = mountains.id
										WHERE reviews.ice = 'yes' ")
		ice_at_mountain.each do |item|
		ice_at_mountain_array << item
		end 
		ice_at_mountain_array.flatten!
		if ice_at_mountain_array.length <= 0
			puts "\n"
			puts "All mountains are currently ice free"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
		else
		ice_at_mountain_array.each do |item|
			puts "\n"
			puts "It has been reported that it is icey at #{item}"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
		end

	end 

	elsif user_option == 'see if there are long lines'
		lines_at_mountain_array = []
		lines_at_mountain = db.execute("SELECT mountains.name
										FROM mountains
										INNER JOIN reviews ON reviews.mountain_id = mountains.id
										WHERE reviews.lines = 'yes' ")
		lines_at_mountain.each do |item|
		lines_at_mountain_array << item
		end 
		lines_at_mountain_array.flatten!
		if lines_at_mountain_array.length <= 0
			puts "\n"
			puts "The lines are short everywhere"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
		else
		ice_at_mountain_array.each do |item|
			puts "\n"
			puts "It has been reported that there are long lines at #{item}"
			puts "\n"
			puts "Would you like to do anything else?"
			puts "yes or no"
			anything_esle = gets.chomp.downcase
			puts "\n"
			puts "\n"
		end
	end

	end

end  









