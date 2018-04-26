class List {
  // your code here
  constructor(title){
    this.title = title
  }

  render() {
    return `<div><h2>${this.title}<button data-id="1" class="delete-list">X</button></h2>
          <ul>
            <li data-id="1">Task: desc <br> Priority: prio</li>
          </ul></div>`
  }
}
