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

def alphabet_finder(x)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  position = alphabet.index(x)
  position -=1 
  char = alphabet[position]
end


def decrypt(string)
  index= 0 
  new_word = ""
  while index < string.length
  x = string[index]
  new_word += alphabet_finder(x)
  index += 1
  end
  puts new_word
end

valid_input = false
until valid_input

puts "Do you want to encrypt of decrypt a password?"
encrypt_decrypt = gets.chomp
	if encrypt_decrypt == "encrypt"
		valid_input = true
		puts "What is the password you want to encrypt?"
		password_encrypt = gets.chomp 
			puts "here is your password encrypted" 
				encrypt(password_encrypt)
	elsif encrypt_decrypt = "decrypt"
		valid_input = true
		puts "What is the password you want to decrypt?"
		password_decrypt = gets.chomp
			puts "here is your password decrypted"
				decrypt(password_decrypt)
	else
		puts "Please select either encrypt or decrypt"
	end
end