#encrypt function
#for every letter in the word, if the letter =x turn it into key letter
#add key letter to "new_word"
#once all letters turned into key letters print "new_word"

def encrypt(string)
  index= 0 
  while index < string.length 
  string[index] = string[index].next!
  index+=1
  end
puts string
end 

#decrypt function
#for every letter in the word move the letter to the previous letter in the alphabet
#print new word
