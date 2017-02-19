// //sort array by item.length
// //call .last to find the longest item...update call on the first item in the array 

function longest_item(array){
array.sort(function(a, b){return b.length-a.length} );
return(array[0])
}
// arr = ["long phrase","longest phrase","longer phrase"];
// console.log(longest_item(arr))



//create a method that takes 2 objects as arguments
//put the keys and values into an array 
//create an if statement that compares the index of the two arrays
//if true return true, if false return false


function compare_objects(obj1, obj2){
  var arr1 = [];
  var arr2 = [];
  
  for(var key in obj1){
    arr1.push(key, obj1[key])
  }
  
  for (var value in obj2){
    arr2.push(value, obj2[value])
  }
  
  for (i=0; i<arr1.length; i++) {
    if (arr1[i] == arr2[i]){
    return true; 
    }
    
  }
  return false;
}

// compare_objects(dog_1, dog_2)

// var dog_1 = {name:"hank", age:2 }
// var dog_2 = {name:"hank", age:2 }




function random_string(number_of_strings){
  var array = [];
  for(var x=0; x < number_of_strings; x++){
    var word = '';
    var rand_num = Math.floor((Math.random() * 10-1) + 1);
    var alphabet = "abcdefghijklmnopqrstuvwxyz"
      for(var i=0; i<rand_num; i++){
        word += alphabet.charAt(Math.floor(Math.random() * alphabet.length));
      }
    array.push(word);
  }
  return array;
}

// console.log(random_string(4))
// console.log(longest_item(random_string(4)))


for(var i=0; i<10; i++){
  var rand_word_array = random_string(4);
  console.log(rand_word_array)
  console.log("The longest string is: " + longest_item(rand_word_array))
}


