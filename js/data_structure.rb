colors = ["red", "blue", "purple", "green"]
names = ["ginger", "ed", "speedy", "duncan"]

colors.push("white")
names.push("greg")

// console.log('colors: '  + colors)
// console.log("names: " + names)


function horse_name() {
  horse_array = []
  for(var i=0; i <=colors.length-1; i++){
    var horse = {name: names[i], color: colors[i]};
    horse_array.push(horse)
  }
return(horse_array)
}


console.log(horse_name())

function Car(model, year, color) {
  this.model = model;
  this.year = year;
  this.color = color; 
  this.engine = function(){console.log("vrooooom");};
}

var newCar = new Car("honda", 2016, "black")
console.log(newCar);
newCar.engine()