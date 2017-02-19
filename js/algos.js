//sort array by item.length
//call .last to find the longest item...update call on the first item in the array 

function longest_item(array){
array.sort(function(a, b){return b.length-a.length} );
return(array[0])
}


arr = ["long phrase","longest phrase","longer phrase"];

console.log(longest_item(arr))