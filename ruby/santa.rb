class Santa
	attr_reader :age, :ethnicity, :reindeer_ranking
	attr_accessor :gender, 
	
	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = rand(0..140)
	end 

	def speak
		puts "Ho, ho, ho! Happy Holidays!"
	end

	def eat_milk_and_cookies(type)
		puts "Santa likes a #{type} cookie!"	
	end
	
	def celebrate_birthday
	  @age +=1 
	end 
	
	def get_mad_at(name)
	  @reindeer_ranking.each do |item|
	    if item == name 
	      @reindeer_ranking.delete(item)
	      @reindeer_ranking.insert(-1,item)
	    end
	  end 
	 p @reindeer_ranking
	end 
	
end


genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
reindeer =  ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
type_of_cookie = ["chocolate chip", "peanut butter", "oatmeal", "double chocolate", ]

140.times do 
  santa = Santa.new(genders.sample, ethnicities.sample)
  p "Santa is #{santa.ethnicity}, #{santa.gender} and #{santa.age} years old"
  santa.get_mad_at(reindeer.sample)
  p santa.celebrate_birthday
  santa.eat_milk_and_cookies(type_of_cookie.sample)
  puts "|------------------------------------------------|"
  puts "
  "
end 

