document.addEventListener('DOMContentLoaded', () => {
  let allPokemonData = []
  const pokemonContainer = document.querySelector('#pokemon-container') // container to put pokemon
  const pokemonSearchInput = document.querySelector('#pokemon-search-form') //form for searching pokemon

  const postPokeForm = document.querySelector('#pokemon-post-form') //form for creating poke

  fetch('http://localhost:3000/pokemon')
    .then((responseObject) => responseObject.json())
    .then((pokeJSONData) => {
      allPokemonData = pokeJSONData
      pokemonContainer.innerHTML = renderAllPokemon(allPokemonData)
  })

  pokemonSearchInput.addEventListener('input', (event) => handleSearchInput(event, allPokemonData, pokemonContainer))

  pokemonContainer.addEventListener('click', (event) => handleContainerClick(event, allPokemonData))

  postPokeForm.addEventListener('submit', (event) => handleCreatePoke(event, pokemonContainer))

})
