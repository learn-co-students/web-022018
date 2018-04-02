/*
  - 7 Data Types in JavaScript
  Number
  String
  Boolean
  undefined
  Object
  null
  Symbol
*/

// Ruby way of writing functions
// def add(a, b)
//   a + b
// end

// JavaScript way of writing functions
// function add(a,b){
//    return a + b
// }

// Primitives are Pass by Value; they make copies
// of the data in the **scope** of our functions
// when passed in. Doesn't actually change the values
// var a = 1
// var b = 2
//
// console.log("Before Swapping")
// console.log("a: " + a)
// console.log("b: " + b)
//
// function swap(x, y) {
//     var temp = x
//     x = y
//     y = temp
// }
//
// swap(a, b)
// console.log("After Swapping")
// console.log("a: " + a)
// console.log("b: " + b)


// Closures, ways of only exposing the results of our
// functions and not letting things get changed outside
// of it that don't have access

// `a` doesn't exist outside of this scope
// function foo(){
//   var a = 1
//   console.log('Before incrementing: ', a)
//   function bar(){
//     return ++a;
//   }
//   return bar();
// }

// Notice the result only stays at 2
// That's because we are returning the **RESULT**
// Of of bar's execution, not the definition
// var result = foo
// console.log(result())
// console.log(result())

// Let's see what happens when we return the definition of bar
//
// function foo() {
//   var a = 1;
//   return function bar(){
//     return a++;
//   }
// }
//
// Notice that we are now returning the definition of bar
// And assigning it to result
// var result = foo()
//
// When we execute result, it increments and each time
// console.log(result())
// console.log(result())


// Switch Statements
// var a = 1
// switch (a) {
//   case 2:
//     console.log('This is another case')
//   break;
//   case 1:
//     console.log('Horray');
//   default:
//     console.log('Not Horray');
//   break;
// }

// If/Else If/Else
// if(a === 1){
//
// } else if (a === 2) {
//
// }

// For loops
// for(var i = 0; i < 10; i++){
//   console.log("This is the value of i", i)
// }

// For... in is for the enumerable properties
// var alphabet = ['a', 'b', 'c', 'd', 'e', 'f']
// for(var property in alphabet){
//   console.log('The property', property )
//   console.log('The value is', alphabet[property])
// }

// For... of is for iterable object
// for(var character of alphabet){
//   console.log('The value is', character)
// }

// var dog = { name: "Spot", size: "Medium", breed: "corgi"}
// for(var property in dog){
//   console.log('The property of dog is', property)
//   console.log('The value of the property', dog[property])
// }

// for(var property in dog){
//   console.log('What is property?', property)
// }
