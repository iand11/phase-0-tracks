require 'sqlite3'
require 'faker'

db = SQLite3::Database.new("reviews.rb")

# create_table_cmd = <<-SQL
# 	CREATE TABLE IF NOT EXISTS users (
# 		id INTEGER PRIMARY KEY,
# 		name VARCHAR(255),
# 		email VARCHAR(255),
# 		phone INT
# 	)
# SQL 

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

db.execute(create_table_users)
db.execute(create_table_reviews)
db.execute(create_table_mountains)