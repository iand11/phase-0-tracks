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
# add_mountains(db, "Kirkwood")
# add_mountains(db, "Heavenly")
# add_mountains(db, "Northstar")
# add_mountains(db, "Squaw")

norther_california_mountains = ['Kirkwood', 'Heavenly', 'Northstar', 'Squaw', 'Homewood', 'Sierra_at_Tahoe', 'Tahoe_Donner', 'Soda_Springs', 'Bear_Valley', 'Sugar_Bowl', 'Boreal_Mountain', 'Mammoth', 'China_Peak']
# norther_california_mountains.each do |item|
# 	add_mountains(db, item)
# end 

# puts  db.execute("SELECT * FROM mountains")
# puts db.execute("SELECT * FROM users")

current_mount = ''

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
puts db.execute("SELECT * FROM users") 



loop do
puts "Please select a mountain from the list:"
puts  norther_california_mountains
current_mount = gets.chomp.capitalize 
break if norther_california_mountains.include? current_mount
p '|----------------------------------------------------------------------|'
end 


x = db.execute("SELECT * FROM mountains WHERE name = '#{current_mount}'")
mountain_number =  x[0][0]









