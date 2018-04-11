// Create a new list
// 1. We take the value inside of our input
// 2. make a new list below with that value
// 3. reveal a create task form

document.addEventListener('DOMContentLoaded', function(){

  let app = document.getElementById('app-content')
  let masterList = []
  console.log('THE DOM CONTENT HAS LOADED')
  let createNewListForm = document.getElementById('create-list-form')


  function revealCreateTaskForm(){
    return `<form id="create-task-form">
    <label for="parent-list">Select List:</label>
    <select id="parent-list">
      <!-- Major key alert:
      read the docs for HTML option selected:
      https://www.w3schools.com/tags/att_option_selected.asp -->

    </select>

    <label for="new-task-description">Task description:</label>
    <input required type="text" id="new-task-description" placeholder="description">

    <label for="new-task-priority">Priority level:</label>
    <input type="text" id="new-task-priority" placeholder="priority">
    <input type="submit" value="Create New Task">
  </form>`
  }

  function createNewList(event){
    event.preventDefault()
    let listContainer = document.getElementById('lists')

    // This checks to see if listContainer is
    if(!listContainer){
      app.innerHTML += revealCreateTaskForm()
      listContainer = document.createElement('div')
      listContainer.id = 'lists'
      app.append(listContainer)
    }

    let newListTitle = document.getElementById('new-list-title')
    let newList = new List(newListTitle.value)
    masterList.push(newList)
    console.log(masterList)

    // The selector to the createTaskForm
    let parentList = document.getElementById('parent-list')

    parentList.innerHTML = masterList.map((list) => {
      return `<option value="${list.title}">
        ${list.title}
      </option>`
    }).join('')

    listContainer.innerHTML += newList.render()
  }


  createNewListForm.addEventListener('submit', createNewList)
})

console.log('THE DOM CONTENT HASN\'T LOADED')
