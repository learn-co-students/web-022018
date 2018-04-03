// I want a function that takes an array
// and swaps element number n with a given argument

const mySwappyFunc = function(arr, n, el) {
  // these two lines of code get the job done, but they
  // mutate the array that's passed in... so we will
  // avoid this implementation
  // arr[n] = el
  // return arr

  // instead, using ES6's spread operator and the
  // non-destructive slice method, we can return
  // what we want without mutating any external state :)
  return [...arr.slice(0, n), el, ...arr.slice(n + 1)]

}

// composable, pure functions that each handle a small task:
const add = (x,y) => x + y
const multiply = (x,y) => x * y
const subtract = (x,y) => x - y
const divide = (x,y) => x / y

// doSomethingWithFive is a higher-order function (HOF)
// that takes a callback function (operation) and executes
// that callback with the number 5 as one of the arguments
const doSomethingWithFive = (x, operation) => {
  return operation(x, 5)
}
