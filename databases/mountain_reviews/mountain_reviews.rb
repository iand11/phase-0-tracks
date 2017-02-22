require 'sqlite3'
require 'faker'

db = SQLite3::Database.new("reviews.rb")

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
		mountain_id INT,
		date DATETIME,
		snowing BOOLEAN,
		powder BOOLEAN,
		ice BOOLEAN,
		long lines BOOLEAN,
		sunshine BOOLEAN,
		comments VARCHAR(255)
	)
SQL

db.results_as_hash = true
create_table_mountains = <<-SQL
	CREATE TABLE IF NOT EXISTS mountains (
	id INTEGER PRIMARY KEY,
	name VARCHAR(255)
	)
SQL


# db.execute(create_table_users)
# db.execute(create_table_reviews)
# db.execute(create_table_mountains)

def add_user(db, name, email, phone)
	db.execute("INSERT INTO users (name, email, phone) VALUES (?,?,?)", [name, email, phone])
end 

# add_user(db, "ian", "ian.driscoll.o@gmail.com", 5166410404)

def add_mountains(db, mountain_name)
	db.execute("INSERT INTO mountains (name) VALUES (?)", [mountain_name])
end 

def add_review(db, name, mountain, date, snowing, powder, ice, long_lines, sunshine, comment)
	db.execute("INSERT INTO reviews (name, mountain, date, snowing, powder, ice, long_lines, sunshine, comment VALUES (?,?,?,?,?,?,?,?,?)", [name, mountain, date, snowing, powder, ice, long_lines, sunshine, comment])
end 
# add_mountains(db, "Kirkwood")
# add_mountains(db, "Heavenly")
# add_mountains(db, "Northstar")
# add_mountains(db, "Squaw")

norther_california_mountains = ['Kirkwood', 'Heavenly', 'Northstar', 'Squaw', 'Homewood', 'Sierra_at_Tahoe', 'Tahoe_Donner', 'Soda_Springs', 'Bear_Valley', 'Sugar_Bowl', 'Boreal_Mountain', 'Mammoth', 'China_Peak']
# norther_california_mountains.each do |item|
# 	add_mountains(db, item)
# end 

# p db.execute("SELECT * FROM mountains")
# puts db.execute("SELECT * FROM users")




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
p user_id_number
# puts db.execute("SELECT * FROM users") 



#info for mountains table
# current_mount = ''

# loop do
# puts "#{user_name} please select a mountain from the list:"
# puts "\n"
# puts  norther_california_mountains
# current_mount = gets.chomp.capitalize 
# break if norther_california_mountains.include? current_mount
# p '|----------------------------------------------------------------------|'
# end 


# x = db.execute("SELECT * FROM mountains WHERE name = '#{current_mount}'")
# mountain_number =  x[0][0]
# mountain_name = x[0][1]


#info for reviews table
# puts "#{name} you're at #{mountain_name}"
# puts "Tell me about the mountain..."
# puts "\n"


# snowing_question =''
# powder_question =''
# ice_question = ''
# lines_question = ''
# sun_question = ''

#snowing
# loop do 
# 	puts "Is it snowing?"
# 	snowing_question = gets.chomp.downcase
# 	break if snowing_question == 'yes' || snowing_question == 'no'
# 	puts "Please select yes or no"
# end

# #powder
# if snowing_question =='yes'
# 	powder_question = true && snowing_question = true
# elsif snowing_question =='no'
#     snowing_question = false
#   loop do
# 	puts "Is there powder?"
# 	powder_question = gets.chomp.downcase
#   break if powder_question == 'yes' || powder_question == 'no'
#     puts "Please select yes or no"
#   end 
#     if powder_question == 'yes'
#     	powder_question = true
#     elsif powder_question == 'no'
#     	powder_question = false 
#     end
# end 

# #ice
# loop do 
# 	puts "Is there any ice?"
# 	ice_question = gets.chomp 
# 	break if ice_question == 'yes' || ice_question == 'no'
# 	puts "Please select yes or no"
# end 

# #long lines
# loop do 
# 	puts "Are there long lines?"
# 	lines_question = gets.chomp 
# 	break if lines_question == 'yes' || lines_question == 'no'
# 	puts "Please select yes or no"
# end 

# #sunshine
# loop do 
# 	puts "Is it sunny?"
# 	sun_question = gets.chomp 
# 	break if sun_question == 'yes' || sun_question == 'no'
# 	puts "Please select yes or no"
# end 

# puts "Is there anything you would like to say about the mountain?"
# puts "When done hit enter"
# user_comments = gets.chomp


 
			








