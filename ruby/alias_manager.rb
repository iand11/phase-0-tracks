#flip first and last name
#define voul
#change voul to next in line 



#one method using gsub...takes a while to write out but it works
def name_flip(string)
	string.split(" ").reverse.join(" ")
end

def voul_change(string)
	string.gsub!(/[aeiouAEIOU]/, "a"=>"e", "e"=>"i", "i"=>"o", "o"=>"u", "u"=>"a", "A"=>"E", "E"=>"I", "I"=>"O", "O"=>"U", "U"=>"A")
end

def consonant_change(string)
	string.gsub!(/[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]/, "b"=>"c", "c"=>"d", "d"=>"f", "f"=>"g", "g"=>"h", "h"=>"j", "j"=>"k", "k"=>"l", "l"=>"m", "m"=>"n", "n"=>"p", "p"=>"q", "q"=>"r", "r"=>"s", "s"=>"t", "t"=>"v", "v"=>"w", "w"=>"x", "x"=>"y", "y"=>"z", "z"=>"b", "B"=>"C", "C"=>"D", "D"=>"F", "F"=>"G", "G"=>"H", "H"=>"J", "J"=>"K", "K"=>"L", "L"=>"M", "M"=>"N", "N"=>"P", "P"=>"Q", "Q"=>"R", "R"=>"S", "S"=>"T", "T"=>"V", "V"=>"W", "W"=>"X", "X"=>"Y", "Y"=>"Z", "Z"=>"B")
end

  
def new_name(string)
  consonant_change(voul_change(name_flip(string)))
end

def hash_print(hash)
  hash.each do |original_name, fake_name|
    puts "Your original name is #{original_name} and your fake name is #{fake_name}!"
  end 
end 

puts "Please enter a name and we will give you a fake one!"
puts "Once you are done simply type 'quit'"

user_input = "" 
hash = {}
  
  
  until user_input == "quit"
  user_input = gets.chomp 
    if user_input == "quit"
      break
    else 
    fake_name = new_name(user_input)
    end
    
    hash[user_input] = fake_name
end 

hash_print(hash)