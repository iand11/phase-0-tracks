#module Shout
	#def yell_angrily(words)
		#words + "!!!" + " :("
	#end

	#def yelling_happily(input)
		#input + "!!!" + " :)"
	#end 
#end 


#self.yell_angrily("AAAHHHHH")
#self.yelling_happily("AAAHHHHH")

module Shout
	def yell_angry (word)
		word + "!!!" + ":( "
	end 

	def yell_happy (word)
		word + "!!!" + ":) " 
	end 
end

class Happy
	include Shout
end

class Angry
	include Shout
end


happy = Happy.new
happy.yell_happy("AHHHHHHH")
happy.yell_angry("AHHHHHHH")

angry = Angry.new 
angry.yell_happy("AHHHHHHH")
angry.yell_angry("AHHHHHHH")

