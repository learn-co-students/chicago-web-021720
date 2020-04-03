function handleCreatePoke(event, pokemonContainer) {
  event.preventDefault()

  const formData = {
    name: event.target[0].value,
    sprites: {
      front: event.target[1].value
    }
  }

  event.target.reset()

  const reqObj = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(formData)
  }


  fetch('http://localhost:3000/pokemon', reqObj)
    .then(resp => resp.json())
    .then(newPoke => {
      coonsole.log(newPoke)
      const pokeHtml = renderSinglePokemon(newPoke)
      pokemonContainer.innerHTML += pokeHtml
    })


}


  // ADD a new pokemon
  // X find the form for adding pokemon
  // X add an eventlistener (specifically a submit of the form
  // once submitted:
  //   x prevent the default behavior of form
  //   x scrape the formdata from the html elements
  //
  //  x  make a post request and send over the form data
  //
  //   update out FE to reflect the new pokemon


function handleSearchInput(event, allPokemonData, pokemonContainer) {
  const filteredPokes = allPokemonData.filter(pokeObj => {
    return pokeObj.name.includes(event.target.value.toLowerCase())
  })

  const filteredPokeHTML = renderAllPokemon(filteredPokes)
  pokemonContainer.innerHTML = filteredPokeHTML ? filteredPokeHTML : `<p><center>There are no Pokémon here</center></p>`
}


function handleContainerClick(event, allPokemonData) {
  if (event.target.dataset.action === 'flip') { // checking if an image is what got clicked
    const clickedPokemon = allPokemonData.find((pokemonObject) => pokemonObject.id == event.target.dataset.id)
    event.target.src = (event.target.src === clickedPokemon.sprites.front ? clickedPokemon.sprites.back : clickedPokemon.sprites.front)
  } else if (event.target.dataset.action === 'delete') {
    const id = event.target.dataset.id
    fetch(`http://localhost:3000/pokemon/${id}`, { method: 'DELETE'})
      .then(resp => resp.json())
      .then(data => {

        console.log('new', event.target.previousElementSibling)

        event.target.parentNode.parentNode.remove()
      })

  }
}


  // add eventlistener to the entire dicv that holds all the cards
  //
  //  check if the thing that got clicked was a delete button
  //   if true:
  //      send a deltete fetch req to  estroy the instance in the BE
//         grab id of pokemon to delete
//         build the request object and url
//
//         once succeful
    //      also remove the card of that pokemon from the FE
  //      

/************************* Helper Fns for Producing HTML **********************/
function renderAllPokemon(pokemonArray) {
  return pokemonArray.map(renderSinglePokemon).join('')
}

function renderSinglePokemon(pokemon) {
  return (`
  <div class="pokemon-card">
    <div class="pokemon-frame">
      <h1 class="center-text">${pokemon.name}</h1>
      <div class="pokemon-image">
        <img data-id="${pokemon.id}" data-action="flip" class="toggle-sprite" src="${pokemon.sprites.front}">
      </div>
      <button data-id="${pokemon.id}" data-action="delete" class="pokemon-button">Delete</button>
    </div>
  </div>`)
}



