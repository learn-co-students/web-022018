// by assigning an Immediately Invoked Function Expression (IIFE)
// to the variable `libraryFunc`, we have a closure where the
// returned anonymous function retains access to the variable `id`,
// and we no longer have to worry about it conflicting or getting
// overwritten by some other variable with the same name

const libraryFunc = (() => {
  let id = 0
  return () => {
    return {
      id: id++,
      name: `Object number ${id}`
    }
  }
})()
