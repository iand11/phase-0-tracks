#get users information
#input users information into a hash with keys
#ask the user if they want to change anything
#if user wants to change somehting...input the change, update the hash, and print the hash


puts "What is your name?"
name = gets.chomp 

puts "How many children do you have?"
number_of_children = gets.chomp.to_i 

puts "What is your decor theme?"
decor_theme = gets.chomp 

puts "What is your address?"
address = gets.chomp 

puts "What month do you want to start? ex: March"
month_start = gets.chomp 

inter_design = {
  "name" => name,
  "number of children" => number_of_children,
  "choice of decor" => decor_theme,
  "address" => address,
  "start month" => month_start
}

puts inter_design.each {|key, value| puts "Your #{key} is #{value}" }

puts "Is there anything you would like to change? ex: name/number of children/address if no please type 'none'"
change = gets.chomp 
if change == "none"
  puts "Ok, Thank you!"
elsif change == "name"
  puts "Please give your updated name"
  uptdated_name = gets.chomp 
  inter_design["name"] = uptdated_name
  puts "Here is your updated info. Thank you!"
  puts inter_design.each {|key, value| puts "Your #{key} is #{value}" }
elsif change == "number of children"
  puts "Please give your updated number of children"
  uptdated_number_of_children = gets.chomp.to_i 
  inter_design["number of children"] = uptdated_number_of_children
  puts "Here is your updated info. Thank you!"
  puts inter_design.each {|key, value| puts "Your #{key} is #{value}" }
elsif change == "choice of decor"
  puts "Please give your updated choice of decor"
  uptdated_choice_of_decor = gets.chomp 
  inter_design["choice of decor"] = uptdated_choice_of_decor
  puts "Here is your updated info. Thank you!"
  puts inter_design.each {|key, value| puts "Your #{key} is #{value}" }
elsif change == "address"
  puts "Please give your updated address"
  uptdated_address = gets.chomp 
  inter_design["address"] = uptdated_address
  puts "Here is your updated info. Thank you!"
  puts inter_design.each {|key, value| puts "Your #{key} is #{value}" }
else change == "start month"
  puts "Please give your updated start month"
  uptdated_start_month = gets.chomp 
  inter_design["start month"] = uptdated_start_month
  puts "Here is your updated info. Thank you!"
  puts inter_design.each {|key, value| puts "Your #{key} is #{value}" }
end 
