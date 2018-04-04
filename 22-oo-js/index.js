// Object Literals - Dogs
// These objects exist but now we have to be careful to make sure all
// Keys are written the same way otherwise we can't access them the same way

// let dog1 = { name: "Corgo", breed: "corgi", favToy: 'rubber ducky'}
// let dog2 = { name: "Corgon", breed: "husky", fav_toy: 'stick'}


// Object Factories
// They generate objects for us that will create an object within
// the function and then return it for us

// function dogFactory(name, breed, favToy){
//   let obj = {}
//   obj.name = name
//   obj.breed = breed
//   obj.favToy = favToy
//   obj.bark = function() {
//     console.log(`${this.name} goes and barks.`)
//   }
//
//   return obj
// }

// let dog1 = dogFactory('Corgo', 'corgi', 'rubber ducky')
// let dog2 = dogFactory('Corgon', 'husky', 'stick')


// Constructor Functions
// We will use this function to allow us to use the `new` keyword
// On top of that, let's look at how we can make sure every object has
// an instance method that are all the same function (Class.prototype.func)

// function Dog(name, breed, favToy){
//     this.name = name
//     this.breed = breed
//     this.favToy = favToy
// }
// Dog.prototype.bark = function() {
//   console.log(`${this.name} goes and barks.`)
// }


// Class Syntax
// This is new ES6 syntax. It is just syntactical sugar that makes it easier
// to do what we were doing before with Constructor Functions

// class Dog {
//   constructor(name, breed, favToy){
//     this.name = name
//     this.breed = breed
//     this.favToy = favToy
//   }
//
//   bark() {
//     console.log(`${this.name} goes and barks.`)
//   }
// }
//
//
//
// let dog1 = new Dog('Corgo', 'corgi', 'rubber ducky')
// let dog2 = new Dog('Corgon', 'husky', 'stick')


// Module Pattern
// It allows us to *hide* data using a closure
// Notice we have an `all` array and it is declared in our outer function
// but is utilized within our class. The goal is to make it so the all
// array would only get data when we *create* a new object.

// When we look at the `let Dinosaur = ...` that is actually what we will
// use to call for our new keyword, the `return class Dinosaur...` line just
// says return a Class Dinosaur definition (if we omit the Dinosaur on that, the
// new object won't have a name)
let Dinosaur = (function(){
  let all = []
  let id = 0;

  return class Dinosaur {
    constructor(name, species, diet, numTeeth){
      this.name = name
      this.species = species
      this.diet = diet
      this.numTeeth = numTeeth
      this.id = ++id
      all.push(this)
    }

    static all() {
      return [...all]

      // Does the same thing as above
      // return all.slice()
    }
  }
})()



let littleFoot = new Dinosaur('Little Foot', 'Bronto', 'herb', 40)
let petri = new Dinosaur('Petri', 'Ptero', 'omni', 35)
let sarah = new Dinosaur('Sarah', 'Tric', 'herb', 60)
