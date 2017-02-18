//take the string and convert it into an array
//create a empty new array
//fill the empty array with the items from the string array
//insert the items at 0 index of the new array 
//print the new array as a string 

function reverse(string) {
array = string.split('')
new_array = []
  for (var i = 0; i <= array.length -1 ; i++) {
    new_array.unshift(array[i]);
  }
return new_array.join("")
}