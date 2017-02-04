number_array = [1,2,3,55,6,9]

friends_hash = {
	tallest: "Mike",
	funniest: "Ali",
	oldest: "John",
	newest: "Kaiti"
}

# .each for array
number_array.each do |number|
  if number < 10
  	puts "#{number} is < 10"
  else
  	puts "#{number} is > 10"
  end 
end 



number_array.map do |number|
  if number < 10
    "#{number} is less than 10"
  else
    "#{number} is greater than 10"
  end 
  
end 

p number_array

friends_hash.each do |description, name|
  puts "My friend #{name} is the #{description} friend I have"
end 

# A method that iterates through the items, deleting any that meet a certain condition - array 
number_array.delete_if { |number| number > 10 }
p number_array

# A method that iterates through the items, deleting any that meet a certain condition - hash
friends_hash.delete_if { |description, name| name.length >= 5 }
p friends_hash

# A method that filters a data structure for only items that do satisfy a certain condition - array 
number_array.keep_if {|number| number > 2 }
p number_array

# A method that filters a data structure for only items that do satisfy a certain condition - hash 
friends_hash.keep_if {|description, name| description.to_s.start_with?("f") == true }
p friends_hash

#A different method that filters a data structure for only items satisfying a certain condition - array 
number_array.select!{ |number| number >3 }
p number_array

#A different method that filters a data structure for only items satisfying a certain condition - hash
p friends_hash.select!{ |description, name | name.include?("i") == true }
p friends_hash