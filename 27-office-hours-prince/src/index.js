document.addEventListener("DOMContentLoaded", function() {

  let pokemonSearch = document.getElementById('pokemon-search-form')
  let pokemonContainer = document.getElementById('pokemon-container')
  const pokemons = POKEMON.pokemons.map((pokemon) => {return new Pokemon(pokemon.name, pokemon.sprites)})

  // Objective to doing the filter
  pokemonSearch.addEventListener('keyup', function(event){
    pokemonContainer.innerHTML = ""

    let filteredPokemon = pokemons.filter((pokemon) => {
      return pokemon.name.match(event.target.value)
    })

    filteredPokemon.forEach(pokemon => {
      pokemonContainer.innerHTML +=  pokemon.render()
    })
  })

  // Flip the image
  pokemonContainer.addEventListener('click', function(event){
    if(event.target.tagName === "P"){
      console.log('inside of the click of pokemonContainer')
      let clickedPokemon = event.target.dataset.pokename
      let foundPokemon = pokemons.find(pokemon => pokemon.name === clickedPokemon)
      let pokeImage = event.target.parentNode.querySelector('img')
      if(pokeImage.src === foundPokemon.sprites.front){
        pokeImage.src = foundPokemon.sprites.back
      } else {
        pokeImage.src = foundPokemon.sprites.front
      }
    }
  })
})
