class Puppy
  def speak(i)
    i.times do 
      puts "Woof!"
    end
  end 
  
  def roll_over
    puts "roll over"
  end 
  
  def dog_years(i)
    years = i *7
    p years
  end
  
  def jump
    puts "jump"
  end 
  
end 


puppy = Puppy.new 
puppy.speak(3)
puppy.roll_over
puppy.dog_years(3)
puppy.jump


class Gymnast 
   
  def initialize
  	puts "Initializing new gymnast instance..."
  end 
   
  def flip(int)
  	int.times do 
  	puts "flips*"
  	end 
  end 
   
  def jump
  	puts "*JUMP!"
  end 
   
end 

new_gymnasts = [] 

50.times do 
  new_gymnasts << gymnast = Gymnast.new 
end 

new_gymnasts.each do |item| 
   
  item.flip(3)
  item.jump
   
end


