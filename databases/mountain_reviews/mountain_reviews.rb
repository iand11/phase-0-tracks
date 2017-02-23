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
		comments VARCHAR(255)
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

options = ['write a review', 'read reviews from a user', 'read reviews of a mountain', 'see if it is snowing', 'see if there is powder', 'see if there is ice', 'see if there are long lines', 'see if there are long lines']



#-------------------------------------------------------------------------------------------------------------

# DRIVER CODE


user_name=''
user_email=''
user_phone_number=''


#info for users table
puts "Welcome to Norther California Mountain Reviews"
puts "\n"
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



puts "\n"
puts "\n"

user_option = ''

loop do 
puts "Please select what you would like to do from the list below: "
option.each do |item|
	puts item
end 
user_option = gets.chomp 
break if options.include? user_option
end 
	if user_option == "write a review"

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
		else 
			puts "Ok thanks for taking part in our experiment!" 
		end 

	elsif user_option == 'read reviews from a user'
		selection_of_user = ''
		users_who_wrote_reviews = []
		loop do 
		puts "Please select a user"
		user_select_method = db.execute("SELECT users.name FROM users")
			user_select_method.each do |item|
				users_who_wrote_reviews << item
			end 
		puts user_select_method
		selection_of_user = gets.chomp 
		break if users_who_wrote_reviews.include? selection_of_user || selection_of_user == 'done'
		puts "Please select a user"
		puts "Or type done to exit"
		selection_of_user = gets.chomp
		end 
			if selection_of_user != 'done'
			specific_user_review = db.execute("SELECT users.name, mountains.name, reviews.comments, reviews.today_date
										FROM users
										INNER JOIN reviews ON reviews.user_id = users.id
										INNER JOIN mountains ON reviews.mountain_id = mountains.id
										WHERE users.name = '#{selection_of_user}'")
			puts "Here are the review(s) from #{selection_of_user}: "
			puts specific_user_review
			else
				puts "Thanks"
			end
	end 
	
	else
		puts "done for now"








