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

norther_california_mountains = ['Homewood', 'Sierra-at-Tahoe', 'Tahoe Donner', 'Soda Springs', 'Bear Valley', 'Sugar Bowl', 'Boreal Mountain', 'Mammoth', 'China Peak']
norther_california_mountains.each do |item|
	add_mountains(db, item)
end 

