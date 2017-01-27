#encrypt function
#for every letter in the word, if the letter =x turn it into key letter
#add key letter to "new_word"
#once all letters turned into key letters print "new_word"



def encrypt(string)
  index= 0
  new_word = ""
  while index < string.length
    if string[index] == "z"
      char = "a"
      new_word += char
    elsif
      char = string[index]
      char = char.next
      new_word += char
    end
    index += 1
  end
puts new_word
end


#set alphabet to a string that contains the alphabet in order
#find the index position of the character that you are looking for
#change the index position to one before
#set the character to the new character

def alphabet_finder(x)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  position = alphabet.index(x)
  position -= 1
  char = alphabet[position]
end


#decrypt function
#for every letter in the word move the letter to the previous letter in the alphabet
#print new word


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




#Taking user input

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
 elsif encrypt_decrypt == "decrypt"
     valid_input = true
     puts "What is the password you want to decrypt?"
     password_decrypt = gets.chomp
     puts "here is your password decrypted"
     decrypt(password_decrypt)
 else
     puts "Please select either encrypt or decrypt"
 end
end