// Grabbing things from the DOM
// All of these we can use, each doing different things
// 1. document.querySelector
// 2. document.querySelectorAll
// 3. document.getElementById
// 4. document.getElementsByClassName
// 5. document.getElementsByTagName

// We can create elements using .createElement
// We give it the tag name and it will generate that particular element for us
let pTag = document.createElement('p')

// Ways of changing text inside, once again each having their own impact
// .innerText -- changes the text and makes sure all is a string
// .innerHTML -- changes the html in between the tags and renders it like HTML
pTag.innerText = 'Some fancy new text'

// Adding things onto the page
// We grab the place we want to add to, then append the element we want to have there.
let div = document.getElementById('main')
div.append(pTag)

// Adding Styles
// We can add styles to our elements as well, we access them
// through the .styles (they represent the same things we would use CSS for)
pTag.style.color = 'goldenrod'
pTag.style.fontSize = '2em'


let personTitle = document.createElement('h3')

personTitle.innerText = 'Fancy Developer'

div.append(personTitle)


// We can use .remove() to get elements OFF the page
// This will also delete any children underneath our element that we delete too
// document.querySelector('a').remove()


/* Activity Goal
  1. Go to Google
  2. Delete the content in the body tag
  3. Add two elements onto the page
  4. Style one of those elements
*/

let someElement = document.createElement('p')

someElement.innerText = '<p>This is just some text</p>'

document.body.append(someElement)
