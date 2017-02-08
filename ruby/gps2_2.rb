# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # Create a hash: keys = items, and the value = quantity
  # Convert the string into an array
  # Push each element into the corresponding key
  # set default quantity = 1
  # print the list to the console [can you use one of your other methods here?]
# output: [what data type goes here, array or hash?]
def create_list(string)
  grocery_list = {}
  array = string.split(" ")
  array.each do |item|
    grocery_list[item] = 1
  end
p grocery_list
end 
# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: 
    # define the method (list, item, quantity)
    # list[item] = quantity
# output: print the hash
def add_to_list(list, item, quantity = 1)
  list[item] = quantity
  p list 
end 


# Method to remove an item from the list
# input: list name, item name
# steps: 
    # define method (list, item)
    # list.delete (items)
# output: print hash
def remove_from_list(list, item)
  list.delete(item)
  p list
end 

# Method to update the quantity of an item
# input: list, item, quantity
# steps:
    # define method (list, item, quantity)
    # list[item] = quantity
# output: print hash
def update_quantity(list, item, quantity)
   list[item] = quantity
  p list 
end 

# Method to print a list and make it look pretty
# input: list 
# steps:
    # define method 
    # list.each do
    # puts list[item]
# output: above
def pretty_list(list)
  puts "Grocery List:"
  list.each do |key, value|
    puts "#{value} #{key}(s)"
  end 
  
end


grocery_list = create_list("carrot apple cereal pizza")
add_to_list(grocery_list, "pear",)
add_to_list(grocery_list, "Lemonade", 2)
add_to_list(grocery_list, "Tomatoes", 3)
add_to_list(grocery_list, "Onion")
add_to_list(grocery_list, "Ice Cream", 4)
remove_from_list(grocery_list, "Lemonade")
update_quantity(grocery_list, "Ice Cream", 1)
pretty_list(grocery_list)

